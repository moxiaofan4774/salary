from django.shortcuts import render
from rest_framework.response import Response
# Create your views here.
from rest_framework.views import APIView
from rest_framework import viewsets, status
from rest_framework.decorators import action
from .serializers import LoginSerializer, UserInfoSerializer, ChangePasswordSerializer, UserAdminSerializer, \
    RoleSerializer, UserSimpleSerializer, FrontLoginSerializer
from .models import UserInfo, Role
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


class UserViewSet(viewsets.ModelViewSet):
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

class RoleViewSet(viewsets.ModelViewSet):
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
