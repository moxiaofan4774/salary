from django.shortcuts import render
from rest_framework.response import Response
# Create your views here.
from rest_framework.views import APIView
from rest_framework import viewsets, status
from rest_framework.decorators import action
from .serializers import LoginSerializer, UserInfoSerializer, ChangePasswordSerializer, UserAdminSerializer, \
    RoleSerializer, UserSimpleSerializer, FrontLoginSerializer, DepartmentSerializer, TitleCategorySerializer, \
    EmployeeProfileSerializer, EmployeeTitleHistorySerializer, OperationLogSerializer
from .models import UserInfo, Role, Department, TitleCategory, EmployeeProfile, EmployeeTitleHistory, OperationLog
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth import authenticate
from django.contrib.auth.hashers import make_password
from rest_framework.permissions import AllowAny, IsAuthenticated
from django.db.models import Q
from apps.paginations import MyPageNumberPagination
from apps.menu.models import Menu
from apps.menu.serializers import MenuListSerializer
import pandas as pd
import traceback
from rest_framework import status  # 导入DRF的状态码常量
from django_cas_ng.utils import get_cas_client
from django_cas_ng import views
from django.conf import settings
from .filter import DepartmentFilter
from rest_framework import permissions


class LoggingMixin:
    """操作日志记录混入类"""

    def perform_create(self, serializer):
        instance = serializer.save()
        self._log_operation('CREATE', instance)
        return instance

    def perform_update(self, serializer):
        instance = serializer.save()
        self._log_operation('UPDATE', instance)
        return instance

    def perform_destroy(self, instance):
        self._log_operation('DELETE', instance)
        instance.delete()

    def _log_operation(self, action, instance):
        """记录操作日志"""
        try:
            # 获取操作人信息
            operator = self.request.user if self.request.user.is_authenticated else None
            operator_name = getattr(operator, 'username', '匿名用户')

            # 获取IP地址
            x_forwarded_for = self.request.META.get('HTTP_X_FORWARDED_FOR')
            if x_forwarded_for:
                ip_address = x_forwarded_for.split(',')[0]
            else:
                ip_address = self.request.META.get('REMOTE_ADDR')

            # 创建日志记录
            OperationLog.objects.create(
                operator=operator,
                operator_name=operator_name,
                action=action,
                resource_type=instance.__class__.__name__,
                resource_id=str(instance.id),
                resource_name=str(instance),
                ip_address=ip_address
            )
        except Exception as e:
            # 日志记录失败不应影响主业务
            print(f"操作日志记录失败: {e}")


class LoginView(APIView):
    permission_classes = [AllowAny]
    authentication_classes = []
    def post(self, request):
        loginInfo = LoginSerializer(data=request.data)
        if loginInfo.is_valid():
            username = loginInfo.validated_data.get('username')
            password = loginInfo.validated_data.get('password')
            user = authenticate(username=username, password=password)
            if user:
                if not user.is_active:
                    return Response({'code': 403, 'message': '账号已被禁用，请联系管理员'})
                refresh = RefreshToken.for_user(user)
                token = str(refresh.access_token)
                data = {
                    'token': token,
                    'refresh': str(refresh),
                    'user': UserInfoSerializer(user).data
                }
                return Response({'code': 200, 'message': '登录成功', 'data': data})
            else:
                return Response({'code': 400, 'message': '用户名或密码错误'})
        else:
            return Response({'code': 400, 'message': '请输入完整的登录信息'})

class FrontLoginView(APIView):
    permission_classes = [AllowAny]
    authentication_classes = []
    def post(self, request):
        try:
            loginInfo = FrontLoginSerializer(data=request.data)
            if loginInfo.is_valid():
                employeeId = loginInfo.validated_data.get('employeeId')
                password = loginInfo.validated_data.get('password')

                # 使用自定义认证后端进行认证
                user = authenticate(request, employeeId=employeeId, password=password)

                if user:
                    if not user.is_active:
                        return Response({'code': 403, 'message': '账号已被禁用，请联系管理员'})

                    # 生成 JWT token
                    refresh = RefreshToken.for_user(user)
                    token = str(refresh.access_token)
                    data = {
                        'token': token,
                        'refresh': str(refresh),
                        'user': UserInfoSerializer(user).data
                    }
                    return Response({'code': 200, 'message': '登录成功', 'data': data})
                else:
                    return Response({'code': 400, 'message': '工号或密码错误'})
            else:
                return Response({'code': 400, 'message': '请输入完整的登录信息'})
        except Exception as e:  # 捕获所有异常
            return Response({
                'code': 500,
                'message': '服务器内部错误',
                'error': str(e),  # 错误内容
                'traceback': traceback.format_exc()  # 完整异常栈
            })


class ChangePasswordView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        serializer = ChangePasswordSerializer(data=request.data)
        if serializer.is_valid():
            user = request.user
            old_password = serializer.validated_data.get('old_password')
            new_password = serializer.validated_data.get('new_password')

            # 验证旧密码是否正确
            if not user.check_password(old_password):
                return Response({'code': 400, 'message': '旧密码错误'})

            # 设置新密码
            user.set_password(new_password)
            user.save()

            return Response({'code': 200, 'message': '密码修改成功，请重新登录'})
        else:
            # 获取第一个错误信息
            errors = serializer.errors
            if errors:
                first_error = next(iter(errors.values()))
                if isinstance(first_error, list) and len(first_error) > 0:
                    error_message = first_error[0]
                else:
                    error_message = str(first_error)
            else:
                error_message = '参数验证失败'
            return Response({'code': 400, 'message': error_message})


class UserViewSet(LoggingMixin, viewsets.ModelViewSet):
    """用户管理ViewSet"""
    queryset = UserInfo.objects.all()
    serializer_class = UserAdminSerializer
    permission_classes = [IsAuthenticated]
    pagination_class = MyPageNumberPagination

    def get_queryset(self):
        queryset = UserInfo.objects.all()
        # 搜索功能
        username = self.request.query_params.get('username', None)
        email = self.request.query_params.get('email', None)
        employee_id = self.request.query_params.get('employeeId', None)
        is_active = self.request.query_params.get('is_active', None)
        is_superuser = self.request.query_params.get('is_superuser', None)

        if employee_id:
            queryset = queryset.filter(employeeId__icontains=employee_id)
        if username:
            queryset = queryset.filter(username__icontains=username)
        if email:
            queryset = queryset.filter(email__icontains=email)
        if is_active is not None and is_active != '':
            queryset = queryset.filter(is_active=is_active == 'true')
        if is_superuser is not None and is_superuser != '':
            queryset = queryset.filter(is_superuser=is_superuser == 'true')

        return queryset.order_by('-date_joined')

    @action(detail=True, methods=['post'])
    def toggle_active(self, request, pk=None):
        """切换用户激活状态"""
        user = self.get_object()
        user.is_active = not user.is_active
        user.save()
        status_text = '激活' if user.is_active else '锁定'
        return Response({'code': 200, 'message': f'用户已{status_text}'})

    @action(detail=True, methods=['post'])
    def toggle_superuser(self, request, pk=None):
        """切换用户超级管理员状态"""
        user = self.get_object()
        user.is_superuser = not user.is_superuser
        # 超级管理员自动设置为staff
        if user.is_superuser:
            user.is_staff = True
        user.save()
        status_text = '超级管理员' if user.is_superuser else '普通用户'
        return Response({'code': 200, 'message': f'用户已设置为{status_text}'})

    @action(detail=True, methods=['post'])
    def toggle_staff(self, request, pk=None):
        """设置/取消普通管理员（is_staff）"""
        user = self.get_object()
        user.is_staff = not user.is_staff
        # 如果取消普通管理员同时取消超级管理员标记
        if not user.is_staff and user.is_superuser:
            user.is_superuser = False
        user.save()
        status_text = '后台普通管理员' if user.is_staff else '前台普通用户'
        return Response({'code': 200, 'message': f'用户已设置为{status_text}'})

    @action(detail=True, methods=['post'], url_path='reset_password')
    def reset_password(self, request, pk=None):
        """重置用户密码为默认值"""
        user = self.get_object()
        id_card = getattr(user, 'idCard', '') or ''
        default_password = id_card[-8:] if len(id_card) >= 8 else '12345678'
        user.set_password(default_password)
        user.save()
        return Response({'code': 200, 'message': f'密码已重置为{default_password}'})

    @action(detail=False, methods=['post'])
    def deleteChecked(self, request):
        """批量删除用户"""
        ids = request.data.get('ids', [])
        if not ids:
            return Response({'code': 400, 'message': '请选择要删除的用户'})

        # 防止删除当前登录用户
        if str(request.user.id) in ids or request.user.id in ids:
            return Response({'code': 400, 'message': '不能删除当前登录用户'})

        deleted_count = UserInfo.objects.filter(id__in=ids).delete()[0]
        return Response({'code': 200, 'message': f'成功删除{deleted_count}个用户'})

    def destroy(self, request, *args, **kwargs):
        """删除单个用户"""
        instance = self.get_object()
        # 防止删除当前登录用户
        if instance.id == request.user.id:
            return Response({'code': 400, 'message': '不能删除当前登录用户'},
                          status=status.HTTP_400_BAD_REQUEST)
        self.perform_destroy(instance)
        return Response(status=status.HTTP_204_NO_CONTENT)

    @action(detail=False, methods=['get'], url_path='all')
    def all_users(self, request):
        """提供简单的用户列表，供角色分配用"""
        users = UserInfo.objects.all().order_by('username')
        serializer = UserSimpleSerializer(users, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=['post'], url_path='import_excel')
    def import_excel(self, request):
        """从Excel文件批量导入用户（固定模板，无需逐条校验）"""
        try:
            excel_file = request.FILES.get('file')
            if not excel_file:
                return Response({'code': 400, 'message': '请上传Excel文件'}, status=status.HTTP_400_BAD_REQUEST)

            if not excel_file.name.endswith(('.xlsx', '.xls')):
                return Response({'code': 400, 'message': '文件格式错误，请上传Excel文件'},
                                status=status.HTTP_400_BAD_REQUEST)

            dtype_dict = {
                'employeeId': str,
                'username': str,
                'password': str,
                'idCard': str,
                'telephone': str,
                'email': str,
            }

            try:
                df = pd.read_excel(excel_file, engine='openpyxl', dtype=dtype_dict)
            except Exception as e1:
                try:
                    excel_file.seek(0)
                    df = pd.read_excel(excel_file, engine='xlrd', dtype=dtype_dict)
                except Exception:
                    return Response({'code': 400, 'message': f'Excel文件读取失败: {str(e1)}'},
                                    status=status.HTTP_400_BAD_REQUEST)

            if df.empty:
                return Response({'code': 400, 'message': 'Excel中没有数据'},
                                status=status.HTTP_400_BAD_REQUEST)

            required_fields = ['employeeId', 'username', 'password', 'idCard', 'telephone', 'email']
            missing_required = [field for field in required_fields if field not in df.columns]
            if missing_required:
                return Response({
                    'code': 400,
                    'message': f"Excel缺少必填列: {'、'.join(missing_required)}"
                }, status=status.HTTP_400_BAD_REQUEST)

            df = df.fillna('')
            default_password_hash = make_password('12345678')
            users_to_create = []

            for _, row in df.iterrows():
                employee_id = str(row['employeeId']).strip()
                username = str(row['username']).strip()
                id_card = str(row['idCard']).strip()
                telephone = str(row['telephone']).strip()
                email = str(row['email']).strip()

                user_obj = UserInfo(
                    employeeId=employee_id,
                    username=employee_id,
                    idCard=id_card,
                    telephone=telephone,
                    email=email or '',
                    is_active=True,
                    is_staff=False,
                    is_superuser=False,
                    password=default_password_hash
                )
                users_to_create.append(user_obj)

            if not users_to_create:
                return Response({'code': 400, 'message': 'Excel没有可导入的用户数据'}, status=status.HTTP_400_BAD_REQUEST)

            UserInfo.objects.bulk_create(users_to_create, batch_size=1000)

            return Response({
                'code': 200,
                'message': f'导入完成! 成功: {len(users_to_create)}条',
                'data': {
                    'success_count': len(users_to_create)
                }
            }, status=status.HTTP_200_OK)

        except Exception as e:
            return Response({
                'code': 500,
                'message': f'导入失败: {str(e)}'
            }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    @action(detail=False, methods=['post'], url_path='batch_import')
    def batch_import(self, request):
        """批量导入用户（旧版本，保留兼容性）"""
        users_data = request.data.get('users', [])

        if not users_data:
            return Response({'code': 400, 'message': '没有用户数据'})

        success_count = 0
        error_list = []

        for index, user_data in enumerate(users_data):
            try:
                # 验证必填字段
                employee_id = user_data.get('employeeId', '').strip()
                username = user_data.get('username', '').strip()
                id_card = user_data.get('idCard', '').strip()

                if not employee_id or not username or not id_card:
                    error_list.append(f"第{index + 1}行: 工号、姓名、身份证号为必填项")
                    continue

                # 检查工号是否已存在
                if UserInfo.objects.filter(employeeId=employee_id).exists():
                    error_list.append(f"第{index + 1}行: 工号 {employee_id} 已存在")
                    continue

                # 检查用户名是否已存在
                if UserInfo.objects.filter(username=username).exists():
                    error_list.append(f"第{index + 1}行: 用户名 {username} 已存在")
                    continue

                # 准备用户数据
                password = user_data.get('password', '').strip()
                if not password:
                    # 如果没有提供密码，使用身份证后8位作为默认密码
                    password = id_card[-8:] if len(id_card) >= 8 else '12345678'

                # 创建用户
                user = UserInfo(
                    employeeId=employee_id,
                    username=username,
                    idCard=id_card,
                    email=user_data.get('email', '').strip() or '',
                    telephone=user_data.get('telephone', '').strip() or '',
                    is_active=user_data.get('is_active', True),
                    is_staff=user_data.get('is_staff', False),
                    is_superuser=user_data.get('is_superuser', False),
                )
                user.set_password(password)
                user.save()
                success_count += 1

            except Exception as e:
                error_list.append(f"第{index + 1}行: {str(e)}")
                continue

        # 构建返回消息
        if success_count > 0 and len(error_list) == 0:
            return Response({
                'code': 200,
                'message': f'成功导入 {success_count} 个用户'
            })
        elif success_count > 0 and len(error_list) > 0:
            return Response({
                'code': 200,
                'message': f'成功导入 {success_count} 个用户，{len(error_list)} 个失败',
                'errors': error_list[:10]  # 只返回前10个错误
            })
        else:
            return Response({
                'code': 400,
                'message': '导入失败',
                'errors': error_list[:10]  # 只返回前10个错误
            })

class RoleViewSet(LoggingMixin, viewsets.ModelViewSet):
    """角色视图集（含添加菜单功能）"""
    queryset = Role.objects.all().prefetch_related('menus', 'users')
    serializer_class = RoleSerializer
    permission_classes = [IsAuthenticated]

    @action(detail=True, methods=['get', 'post'], url_path='permissions')
    def permissions(self, request, pk=None):
        """获取或更新角色菜单"""
        role = self.get_object()
        if request.method == 'GET':
            serializer = MenuListSerializer(role.menus.all().order_by('-order'), many=True)
            return Response(serializer.data)

        permission_ids = request.data.get('permissions', [])
        menus = Menu.objects.filter(id__in=permission_ids)
        role.menus.set(menus)
        return Response({'code': 200, 'message': '权限分配成功'})

    @action(detail=True, methods=['get', 'post'], url_path='users')
    def users(self, request, pk=None):
        """获取或更新角色的用户"""
        role = self.get_object()
        if request.method == 'GET':
            serializer = UserSimpleSerializer(role.users.all(), many=True)
            return Response(serializer.data)

        user_ids = request.data.get('users', [])
        users = UserInfo.objects.filter(id__in=user_ids)
        role.users.set(users)
        return Response({'code': 200, 'message': '用户分配成功'})


class GetCasLoginUrlView(APIView):
    """
    前端获取CAS登录跳转地址的接口
    """
    permission_classes = []  # 无需认证即可访问

    def get(self, request):

        # 拼接CAS登录地址（带回调参数，指向Vue前端的回调页面）
        # 替换为你的Vue前端回调页面地址
        # redirect_url = "http://10.0.9.21:8000/api/user/cas-callback/"
        redirect_url = settings.LOGIN_REDIRECT_URL
        cas_client = get_cas_client(service_url=redirect_url,request=request)
        cas_login_url = cas_client.get_login_url()
        return Response({
            "cas_login_url": cas_login_url  # 返回CAS登录地址给前端
        })


class CASCallbackView(APIView):
    """
    前端回调后，验证CAS Ticket并生成JWT的接口
    """
    permission_classes = []
    def post(self, request):
        ticket = request.data.get("ticket")

        if not ticket:
            return Response(
                {"error": "缺少CAS Ticket"},
                status=status.HTTP_400_BAD_REQUEST
            )
        # 1. 验证CAS Ticket（核心：调用CAS服务端验证ticket）
        try:
            # 使用django_cas_ng的核心方法验证ticket
            # service_url = request.build_absolute_uri(request.path)  # 必须与 CAS 登录时的 service 完全一致
            service_url = settings.LOGIN_REDIRECT_URL  # 必须与 CAS 登录时的 service 完全一致
            user = authenticate(request=request, ticket=ticket, service=service_url)
            if not user:
                return Response({"error": "CAS Ticket验证失败"}, status=status.HTTP_401_UNAUTHORIZED)
        except Exception as e:
            return Response(
                {"error": f"CAS验证异常：{str(e)}"},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )
        # 2.根据工号获取用户信息
        try:
            user_login = UserInfo.objects.get(employeeId=user)
            if not user_login:
                return Response({"error": "Ticket验证成功，但没有用户信息，请联系管理员！"}, status=status.HTTP_401_UNAUTHORIZED)
        except Exception as e:
            return Response(
                {"error": f"用户获取异常：{str(e)}"},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )
        # 3. 生成JWT Token（前后端分离的核心：用JWT传递认证状态）
        refresh = RefreshToken.for_user(user_login)
        token = str(refresh.access_token)
        data = {
            'token': token,
            'refresh': str(refresh),
            'user': UserInfoSerializer(user_login).data
        }
        return Response({'code': 200, 'message': '登录成功', 'data': data})


class DepartmentViewSet(LoggingMixin, viewsets.ModelViewSet):
    """部门视图集"""
    queryset = Department.objects.all()
    serializer_class = DepartmentSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = MyPageNumberPagination
    filterset_class = DepartmentFilter

    def get_queryset(self):
        """支持按名称、状态、上级部门过滤"""
        queryset = Department.objects.select_related('parent').prefetch_related('children')

        # 按名称搜索
        name = self.request.query_params.get('name', None)
        if name:
            queryset = queryset.filter(name__icontains=name)

        # 按状态过滤
        is_active = self.request.query_params.get('is_active', None)
        if is_active is not None:
            # 将字符串转换为布尔值
            is_active_bool = is_active.lower() in ['true', '1', 'yes']
            queryset = queryset.filter(is_active=is_active_bool)

        # 按上级部门过滤
        parent_id = self.request.query_params.get('parent_id', None)
        if parent_id:
            queryset = queryset.filter(parent_id=parent_id)

        return queryset.order_by('order', 'id')

    @action(detail=True, methods=['post'], url_path='toggle_active')
    def toggle_active(self, request, pk=None):
        """切换部门启用状态"""
        department = self.get_object()
        department.is_active = not department.is_active
        department.save()

        status_text = "启用" if department.is_active else "禁用"
        return Response({
            'code': 200,
            'message': f'部门已{status_text}',
            'data': {'is_active': department.is_active}
        })


    @action(detail=False, methods=['get'], url_path='tree')
    def tree(self, request):
        """获取部门树形结构"""
        # 只获取启用的部门
        only_active = request.query_params.get('only_active', 'false').lower() == 'true'

        if only_active:
            departments = Department.objects.filter(is_active=True).order_by('order', 'id')
        else:
            departments = Department.objects.all().order_by('order', 'id')

        # 构建树形结构
        def build_tree(parent_id=None):
            nodes = []
            for dept in departments:
                if dept.parent_id == parent_id:
                    node = {
                        'id': str(dept.id),
                        'name': dept.name,
                        'order': dept.order,
                        'is_active': dept.is_active,
                        'description': dept.description,
                        'employee_count': dept.employees.count(),
                        'children': build_tree(dept.id)
                    }
                    nodes.append(node)
            return nodes

        tree_data = build_tree()
        return Response({'code': 200, 'data': tree_data})

    @action(detail=False, methods=['get'], url_path='options')
    def options(self, request):
        """获取部门选项列表（用于下拉框）"""
        departments = Department.objects.filter(is_active=True).order_by('order', 'id')
        data = [{'value': str(dept.id), 'label': dept.name} for dept in departments]
        return Response({'code': 200, 'data': data})

    @action(detail=True, methods=['get'], url_path='children')
    def children(self, request, pk=None):
        """获取指定部门的子部门列表"""
        department = self.get_object()
        children = department.children.all().order_by('order', 'id')
        serializer = self.get_serializer(children, many=True)
        return Response({'code': 200, 'data': serializer.data})

    @action(detail=False, methods=['post'], url_path='deleteChecked')
    def delete_checked(self, request):
        """批量删除部门"""
        ids = request.data.get('ids', [])

        if not ids:
            return Response({'code': 400, 'message': '请选择要删除的部门'},
                        status=status.HTTP_400_BAD_REQUEST)

        # 检查是否有子部门
        departments_with_children = Department.objects.filter(
            id__in=ids,
            children__isnull=False
        ).distinct()

        if departments_with_children.exists():
            dept_names = ', '.join([d.name for d in departments_with_children])
            return Response({
                'code': 400,
                'message': f'以下部门有子部门，无法删除: {dept_names}'
            }, status=status.HTTP_400_BAD_REQUEST)

        # 执行删除
        from django.db import transaction
        with transaction.atomic():
            deleted_count = Department.objects.filter(id__in=ids).delete()[0]

        return Response({
            'code': 200,
            'message': f'成功删除 {deleted_count} 个部门'
        })
    
    def destroy(self, request, *args, **kwargs):
        """删除部门（防止删除有子部门的部门）"""
        department = self.get_object()

        # 检查是否有子部门
        if department.children.exists():
            return Response({
                'code': 400,
                'message': f'部门 "{department.name}" 有子部门，无法删除'
            }, status=status.HTTP_400_BAD_REQUEST)

        # 执行删除
        department.delete()
        return Response({
            'code': 200,
            'message': '部门删除成功'
        })


class TitleCategoryViewSet(LoggingMixin, viewsets.ModelViewSet):
    """职称分类管理视图集"""
    queryset = TitleCategory.objects.all()
    serializer_class = TitleCategorySerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = MyPageNumberPagination

    def get_queryset(self):
        """支持按名称、状态、上级分类过滤"""
        queryset = TitleCategory.objects.select_related('parent').prefetch_related('children')

        # 按名称搜索
        name = self.request.query_params.get('name', None)
        if name:
            queryset = queryset.filter(name__icontains=name)

        # 按状态过滤
        is_active = self.request.query_params.get('is_active', None)
        if is_active is not None:
            # 将字符串转换为布尔值
            is_active_bool = is_active.lower() in ['true', '1', 'yes']
            queryset = queryset.filter(is_active=is_active_bool)

        # 按上级分类过滤
        parent_id = self.request.query_params.get('parent_id', None)
        if parent_id:
            queryset = queryset.filter(parent_id=parent_id)

        return queryset.order_by('order', 'id')

    @action(detail=True, methods=['post'], url_path='toggle_active')
    def toggle_active(self, request, pk=None):
        """切换职称分类启用状态"""
        category = self.get_object()
        category.is_active = not category.is_active
        category.save()

        status_text = "启用" if category.is_active else "禁用"
        return Response({
            'code': 200,
            'message': f'职称分类已{status_text}',
            'data': {'is_active': category.is_active}
        })

    @action(detail=False, methods=['get'], url_path='tree')
    def tree(self, request):
        """获取职称分类树形结构"""
        # 只获取启用的分类
        only_active = request.query_params.get('only_active', 'false').lower() == 'true'

        if only_active:
            categories = TitleCategory.objects.filter(is_active=True).order_by('order', 'id')
        else:
            categories = TitleCategory.objects.all().order_by('order', 'id')

        # 构建树形结构
        def build_tree(parent_id=None):
            nodes = []
            for cat in categories:
                if cat.parent_id == parent_id:
                    node = {
                        'id': str(cat.id),
                        'name': cat.name,
                        'order': cat.order,
                        'is_active': cat.is_active,
                        'description': cat.description,
                        'title_count': cat.employee_titles.filter(is_current=True).count(),
                        'children': build_tree(cat.id)
                    }
                    nodes.append(node)
            return nodes

        tree_data = build_tree()
        return Response({'code': 200, 'data': tree_data})

    @action(detail=False, methods=['get'], url_path='options')
    def options(self, request):
        """获取职称分类选项列表（用于下拉框）"""
        categories = TitleCategory.objects.filter(is_active=True).order_by('order', 'id')
        data = [{'value': str(cat.id), 'label': cat.name} for cat in categories]
        return Response({'code': 200, 'data': data})

    @action(detail=True, methods=['get'], url_path='children')
    def children(self, request, pk=None):
        """获取指定分类的子分类列表"""
        category = self.get_object()
        children = category.children.all().order_by('order', 'id')
        serializer = self.get_serializer(children, many=True)
        return Response({'code': 200, 'data': serializer.data})

    @action(detail=False, methods=['post'], url_path='deleteChecked')
    def delete_checked(self, request):
        """批量删除职称分类"""
        ids = request.data.get('ids', [])

        if not ids:
            return Response({'code': 400, 'message': '请选择要删除的职称分类'},
                           status=status.HTTP_400_BAD_REQUEST)

        # 检查是否有子分类
        categories_with_children = TitleCategory.objects.filter(
            id__in=ids,
            children__isnull=False
        ).distinct()

        if categories_with_children.exists():
            cat_names = ', '.join([c.name for c in categories_with_children])
            return Response({
                'code': 400,
                'message': f'以下分类有子分类，无法删除: {cat_names}'
            }, status=status.HTTP_400_BAD_REQUEST)

        # 执行删除
        from django.db import transaction
        with transaction.atomic():
            deleted_count = TitleCategory.objects.filter(id__in=ids).delete()[0]

        return Response({
            'code': 200,
            'message': f'成功删除 {deleted_count} 个职称分类'
        })

    def destroy(self, request, *args, **kwargs):
        """删除职称分类（防止删除有子分类的分类）"""
        category = self.get_object()

        # 检查是否有子分类
        if category.children.exists():
            return Response({
                'code': 400,
                'message': f'职称分类 "{category.name}" 有子分类，无法删除'
            }, status=status.HTTP_400_BAD_REQUEST)

        # 执行删除
        category.delete()
        return Response({
            'code': 200,
            'message': '职称分类删除成功'
        })


class EmployeeProfileViewSet(LoggingMixin, viewsets.ModelViewSet):
    """员工档案管理视图集"""
    queryset = EmployeeProfile.objects.all()
    serializer_class = EmployeeProfileSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = MyPageNumberPagination

    def get_queryset(self):
        """支持按工号、姓名、部门、状态过滤"""
        queryset = EmployeeProfile.objects.select_related('user', 'department')

        # 按工号搜索
        employeeId = self.request.query_params.get('employeeId', None)
        if employeeId:
            queryset = queryset.filter(employeeId__icontains=employeeId)

        # 按姓名搜索
        realName = self.request.query_params.get('realName', None)
        if realName:
            queryset = queryset.filter(realName__icontains=realName)

        # 按部门过滤
        department_id = self.request.query_params.get('department_id', None)
        if department_id:
            queryset = queryset.filter(department_id=department_id)

        # 按状态过滤
        status_param = self.request.query_params.get('status', None)
        if status_param:
            queryset = queryset.filter(status=status_param)

        return queryset.order_by('-created_at')

    @action(detail=False, methods=['post'], url_path='deleteChecked')
    def delete_checked(self, request):
        """批量删除员工档案"""
        ids = request.data.get('ids', [])

        if not ids:
            return Response({'code': 400, 'message': '请选择要删除的员工档案'},
                           status=status.HTTP_400_BAD_REQUEST)

        # 执行删除
        from django.db import transaction
        with transaction.atomic():
            deleted_count = EmployeeProfile.objects.filter(id__in=ids).delete()[0]

        return Response({
            'code': 200,
            'message': f'成功删除 {deleted_count} 个员工档案'
        })

    @action(detail=False, methods=['post'], url_path='import_excel')
    def import_excel(self, request):
        """从Excel导入员工档案"""
        import pandas as pd
        from django.db import transaction

        file = request.FILES.get('file')
        if not file:
            return Response({'code': 400, 'message': '请上传Excel文件'},
                           status=status.HTTP_400_BAD_REQUEST)

        try:
            # 读取Excel文件
            df = pd.read_excel(file)

            # 验证必填列
            required_columns = ['工号', '姓名', '身份证号']
            missing_columns = [col for col in required_columns if col not in df.columns]
            if missing_columns:
                return Response({
                    'code': 400,
                    'message': f'Excel文件缺少必填列: {", ".join(missing_columns)}'
                }, status=status.HTTP_400_BAD_REQUEST)

            success_count = 0
            error_list = []

            with transaction.atomic():
                for index, row in df.iterrows():
                    try:
                        employeeId = str(row['工号']).strip()
                        realName = str(row['姓名']).strip()
                        idCard = str(row['身份证号']).strip()

                        # 检查工号是否已存在
                        if EmployeeProfile.objects.filter(employeeId=employeeId).exists():
                            error_list.append(f'第{index+2}行: 工号 {employeeId} 已存在')
                            continue

                        # 检查身份证号是否已存在
                        if EmployeeProfile.objects.filter(idCard=idCard).exists():
                            error_list.append(f'第{index+2}行: 身份证号 {idCard} 已存在')
                            continue

                        # 查找或创建关联的UserInfo
                        user, created = UserInfo.objects.get_or_create(
                            username=employeeId,
                            defaults={
                                'employeeId': employeeId,
                                'idCard': idCard,
                                'telephone': str(row.get('联系电话', '')).strip()[:11] if pd.notna(row.get('联系电话')) else '',
                                'email': str(row.get('邮箱', '')).strip() if pd.notna(row.get('邮箱')) else None,
                            }
                        )

                        # 如果用户是新创建的，设置默认密码
                        if created:
                            user.set_password('123456')
                            user.save()

                        # 处理部门
                        department = None
                        if '部门' in df.columns and pd.notna(row['部门']):
                            dept_name = str(row['部门']).strip()
                            try:
                                department = Department.objects.get(name=dept_name)
                            except Department.DoesNotExist:
                                error_list.append(f'第{index+2}行: 部门 "{dept_name}" 不存在')
                                continue

                        # 创建员工档案
                        profile_data = {
                            'user': user,
                            'employeeId': employeeId,
                            'realName': realName,
                            'idCard': idCard,
                            'department': department,
                            'telephone': str(row.get('联系电话', '')).strip()[:11] if pd.notna(row.get('联系电话')) else None,
                            'email': str(row.get('邮箱', '')).strip() if pd.notna(row.get('邮箱')) else None,
                            'address': str(row.get('家庭住址', '')).strip() if pd.notna(row.get('家庭住址')) else None,
                        }

                        # 处理性别
                        if '性别' in df.columns and pd.notna(row['性别']):
                            gender_str = str(row['性别']).strip()
                            if gender_str in ['男', 'male', 'Male', 'M']:
                                profile_data['gender'] = 'male'
                            elif gender_str in ['女', 'female', 'Female', 'F']:
                                profile_data['gender'] = 'female'

                        # 处理出生日期
                        if '出生日期' in df.columns and pd.notna(row['出生日期']):
                            profile_data['birth_date'] = pd.to_datetime(row['出生日期']).date()

                        # 处理入职日期
                        if '入职日期' in df.columns and pd.notna(row['入职日期']):
                            profile_data['entry_date'] = pd.to_datetime(row['入职日期']).date()

                        # 处理员工状态
                        if '状态' in df.columns and pd.notna(row['状态']):
                            status_str = str(row['状态']).strip()
                            status_map = {'在职': 'active', '离职': 'leave', '退休': 'retire'}
                            profile_data['status'] = status_map.get(status_str, 'active')

                        # 处理备注
                        if '备注' in df.columns and pd.notna(row['备注']):
                            profile_data['remark'] = str(row['备注']).strip()

                        EmployeeProfile.objects.create(**profile_data)
                        success_count += 1

                    except Exception as e:
                        error_list.append(f'第{index+2}行: {str(e)}')

            result_message = f'成功导入 {success_count} 条员工档案'
            if error_list:
                result_message += f'，{len(error_list)} 条失败'

            return Response({
                'code': 200,
                'message': result_message,
                'data': {
                    'success_count': success_count,
                    'error_count': len(error_list),
                    'errors': error_list[:10]  # 只返回前10条错误
                }
            })

        except Exception as e:
            return Response({
                'code': 400,
                'message': f'导入失败: {str(e)}'
            }, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['get'], url_path='export_template')
    def export_template(self, request):
        """导出Excel模板"""
        import pandas as pd
        from django.http import HttpResponse
        import io

        # 创建模板数据
        template_data = {
            '工号': ['E001', 'E002'],
            '姓名': ['张三', '李四'],
            '身份证号': ['110101199001011234', '110101199002021234'],
            '性别': ['男', '女'],
            '出生日期': ['1990-01-01', '1990-02-02'],
            '部门': ['技术部', '人事部'],
            '联系电话': ['13800138000', '13800138001'],
            '邮箱': ['zhangsan@example.com', 'lisi@example.com'],
            '家庭住址': ['北京市朝阳区', '北京市海淀区'],
            '入职日期': ['2020-01-01', '2020-02-01'],
            '状态': ['在职', '在职'],
            '备注': ['', '']
        }

        df = pd.DataFrame(template_data)

        # 创建Excel文件
        output = io.BytesIO()
        with pd.ExcelWriter(output, engine='openpyxl') as writer:
            df.to_excel(writer, index=False, sheet_name='员工档案')

        output.seek(0)

        response = HttpResponse(
            output.read(),
            content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        )
        response['Content-Disposition'] = 'attachment; filename="employee_profile_template.xlsx"'

        return response


class EmployeeTitleHistoryViewSet(LoggingMixin, viewsets.ModelViewSet):
    """员工职称历史管理视图集"""
    queryset = EmployeeTitleHistory.objects.all()
    serializer_class = EmployeeTitleHistorySerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = MyPageNumberPagination

    def get_queryset(self):
        """支持按员工、职称分类、是否当前职称过滤"""
        queryset = EmployeeTitleHistory.objects.select_related('employee', 'title_category')

        # 按员工ID过滤
        employee_id = self.request.query_params.get('employee_id', None)
        if employee_id:
            queryset = queryset.filter(employee_id=employee_id)

        # 按员工工号过滤
        employee_no = self.request.query_params.get('employeeId', None)
        if employee_no:
            queryset = queryset.filter(employee__employeeId__icontains=employee_no)

        # 按员工姓名过滤
        employee_name = self.request.query_params.get('realName', None)
        if employee_name:
            queryset = queryset.filter(employee__realName__icontains=employee_name)

        # 按职称分类过滤
        title_category_id = self.request.query_params.get('title_category_id', None)
        if title_category_id:
            queryset = queryset.filter(title_category_id=title_category_id)

        # 按是否当前职称过滤
        is_current = self.request.query_params.get('is_current', None)
        if is_current is not None:
            is_current_bool = is_current.lower() in ['true', '1', 'yes']
            queryset = queryset.filter(is_current=is_current_bool)

        return queryset.order_by('-start_date', '-created_at')

    @action(detail=False, methods=['get'], url_path='by_employee/(?P<employee_id>[^/.]+)')
    def by_employee(self, request, employee_id=None):
        """获取指定员工的职称历史"""
        histories = self.get_queryset().filter(employee_id=employee_id)
        serializer = self.get_serializer(histories, many=True)
        return Response({'code': 200, 'data': serializer.data})

    @action(detail=False, methods=['post'], url_path='set_current')
    def set_current(self, request):
        """设置当前职称"""
        history_id = request.data.get('id')
        if not history_id:
            return Response({'code': 400, 'message': '请提供职称历史ID'},
                           status=status.HTTP_400_BAD_REQUEST)

        try:
            history = EmployeeTitleHistory.objects.get(id=history_id)

            # 将该员工的其他职称设置为非当前
            EmployeeTitleHistory.objects.filter(
                employee=history.employee,
                is_current=True
            ).exclude(id=history_id).update(is_current=False)

            # 设置当前职称
            history.is_current = True
            history.save()

            return Response({
                'code': 200,
                'message': '设置成功',
                'data': {'is_current': True}
            })
        except EmployeeTitleHistory.DoesNotExist:
            return Response({'code': 404, 'message': '职称历史记录不存在'},
                           status=status.HTTP_404_NOT_FOUND)

    @action(detail=False, methods=['post'], url_path='deleteChecked')
    def delete_checked(self, request):
        """批量删除职称历史"""
        ids = request.data.get('ids', [])

        if not ids:
            return Response({'code': 400, 'message': '请选择要删除的职称历史记录'},
                           status=status.HTTP_400_BAD_REQUEST)

        # 执行删除
        from django.db import transaction
        with transaction.atomic():
            deleted_count = EmployeeTitleHistory.objects.filter(id__in=ids).delete()[0]

        return Response({
            'code': 200,
            'message': f'成功删除 {deleted_count} 条职称历史记录'
        })

    @action(detail=False, methods=['get'], url_path='statistics')
    def statistics(self, request):
        """职称统计信息"""
        from django.db.models import Count

        # 按职称分类统计当前在职员工数量
        stats = EmployeeTitleHistory.objects.filter(
            is_current=True
        ).values(
            'title_category__name'
        ).annotate(
            count=Count('id')
        ).order_by('-count')

        return Response({
            'code': 200,
            'data': list(stats)
        })

    @action(detail=False, methods=['post'], url_path='import_excel')
    def import_excel(self, request):
        """从Excel导入职称历史"""
        import pandas as pd
        from django.db import transaction
        from datetime import datetime

        file = request.FILES.get('file')
        if not file:
            return Response({'code': 400, 'message': '请上传Excel文件'},
                           status=status.HTTP_400_BAD_REQUEST)

        try:
            # 读取Excel文件
            df = pd.read_excel(file)

            # 验证必填列
            required_columns = ['工号', '职称分类', '开始日期']
            missing_columns = [col for col in required_columns if col not in df.columns]
            if missing_columns:
                return Response({
                    'code': 400,
                    'message': f'Excel文件缺少必填列: {", ".join(missing_columns)}'
                }, status=status.HTTP_400_BAD_REQUEST)

            success_count = 0
            error_list = []

            with transaction.atomic():
                for index, row in df.iterrows():
                    try:
                        employeeId = str(row['工号']).strip()
                        title_name = str(row['职称分类']).strip()
                        start_date = pd.to_datetime(row['开始日期']).date()

                        # 查找员工
                        try:
                            employee = EmployeeProfile.objects.get(employeeId=employeeId)
                        except EmployeeProfile.DoesNotExist:
                            error_list.append(f'第{index+2}行: 工号 {employeeId} 不存在')
                            continue

                        # 查找职称分类
                        try:
                            title_category = TitleCategory.objects.get(name=title_name)
                        except TitleCategory.DoesNotExist:
                            error_list.append(f'第{index+2}行: 职称分类 "{title_name}" 不存在')
                            continue

                        # 处理结束日期
                        end_date = None
                        if '结束日期' in df.columns and pd.notna(row['结束日期']):
                            end_date = pd.to_datetime(row['结束日期']).date()

                        # 处理是否当前职称
                        is_current = False
                        if '是否当前' in df.columns and pd.notna(row['是否当前']):
                            is_current_str = str(row['是否当前']).strip()
                            is_current = is_current_str in ['是', 'true', 'True', '1', 'yes']

                        # 处理证书编号
                        certificate_number = None
                        if '证书编号' in df.columns and pd.notna(row['证书编号']):
                            certificate_number = str(row['证书编号']).strip()

                        # 处理备注
                        remark = None
                        if '备注' in df.columns and pd.notna(row['备注']):
                            remark = str(row['备注']).strip()

                        # 检查时间重叠
                        queryset = EmployeeTitleHistory.objects.filter(employee=employee)
                        has_overlap = False
                        for history in queryset:
                            history_end = history.end_date if history.end_date else datetime.now().date()
                            current_end = end_date if end_date else datetime.now().date()
                            if not (current_end < history.start_date or start_date > history_end):
                                error_list.append(
                                    f'第{index+2}行: 职称时间与已有记录重叠 '
                                    f'({history.title_category.name}: {history.start_date} 至 {history.end_date or "至今"})'
                                )
                                has_overlap = True
                                break

                        if has_overlap:
                            continue

                        # 创建职称历史
                        history = EmployeeTitleHistory.objects.create(
                            employee=employee,
                            title_category=title_category,
                            start_date=start_date,
                            end_date=end_date,
                            is_current=is_current,
                            certificate_number=certificate_number,
                            remark=remark
                        )
                        success_count += 1

                    except Exception as e:
                        error_list.append(f'第{index+2}行: {str(e)}')

            result_message = f'成功导入 {success_count} 条职称历史记录'
            if error_list:
                result_message += f'，{len(error_list)} 条失败'

            return Response({
                'code': 200,
                'message': result_message,
                'data': {
                    'success_count': success_count,
                    'error_count': len(error_list),
                    'errors': error_list[:10]  # 只返回前10条错误
                }
            })

        except Exception as e:
            return Response({
                'code': 400,
                'message': f'导入失败: {str(e)}'
            }, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['get'], url_path='export_template')
    def export_template(self, request):
        """导出Excel模板"""
        import pandas as pd
        from django.http import HttpResponse
        import io

        # 创建模板数据
        template_data = {
            '工号': ['2008046002', '2008046003'],
            '职称分类': ['教授', '副教授'],
            '开始日期': ['2020-01-01', '2019-01-01'],
            '结束日期': ['', '2024-12-31'],
            '是否当前': ['是', '否'],
            '证书编号': ['CERT001', 'CERT002'],
            '备注': ['', '']
        }

        df = pd.DataFrame(template_data)

        # 创建Excel文件
        output = io.BytesIO()
        with pd.ExcelWriter(output, engine='openpyxl') as writer:
            df.to_excel(writer, index=False, sheet_name='职称历史')

        output.seek(0)

        response = HttpResponse(
            output.read(),
            content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        )
        response['Content-Disposition'] = 'attachment; filename="employee_title_history_template.xlsx"'

        return response


class OperationLogViewSet(viewsets.ReadOnlyModelViewSet):
    """操作日志查询视图集（只读）"""
    queryset = OperationLog.objects.all()
    serializer_class = OperationLogSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = MyPageNumberPagination

    def get_queryset(self):
        """支持按操作人、操作类型、资源类型过滤"""
        queryset = OperationLog.objects.select_related('operator').order_by('-created_at')

        # 按操作人姓名搜索
        operator_name = self.request.query_params.get('operator_name', None)
        if operator_name:
            queryset = queryset.filter(operator_name__icontains=operator_name)

        # 按操作类型过滤
        action = self.request.query_params.get('action', None)
        if action:
            queryset = queryset.filter(action=action)

        # 按资源类型过滤
        resource_type = self.request.query_params.get('resource_type', None)
        if resource_type:
            queryset = queryset.filter(resource_type=resource_type)

        # 按日期范围过滤
        start_date = self.request.query_params.get('start_date', None)
        end_date = self.request.query_params.get('end_date', None)
        if start_date:
            queryset = queryset.filter(created_at__gte=start_date)
        if end_date:
            queryset = queryset.filter(created_at__lte=end_date)

        return queryset
