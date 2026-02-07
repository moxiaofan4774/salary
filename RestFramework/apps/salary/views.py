from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import action
import pandas as pd
from datetime import datetime
# Create your views here.
from .models import YearAndMonth,SalaryYingFa,SalaryKouKuan
from .serializers import YearAndMonthSerializer,SalaryYingFaSerializer,SalaryKouKuanSerializer,YearAndMonthWithSalarySerializer
from .paginations import MyPageNumberPagination
from .filter import SalaryYingFaFilter,SalaryKouKuanFilter



class YearAndMonthViewSet(ModelViewSet):
    permission_classes = (permissions.IsAuthenticatedOrReadOnly, )
    queryset = YearAndMonth.objects.all()
    serializer_class = YearAndMonthSerializer
    pagination_class = MyPageNumberPagination

    @action(detail=False, methods=['GET'], url_path='getUserSalaryList')
    def get_user_salary_list(self, request):
        """
        获取用户的薪资列表（包含应发、扣款、实发）
        需要传入身份证号参数：idCard
        """
        id_card = request.query_params.get('idCard', '').strip()

        # 验证身份证号参数
        if not id_card:
            return Response(
                {'code': 400, 'message': '请提供身份证号'},
                status=status.HTTP_400_BAD_REQUEST
            )

        # 获取所有年月数据
        queryset = self.get_queryset()

        # 使用包含薪资数据的序列化器
        serializer = YearAndMonthWithSalarySerializer(
            queryset,
            many=True,
            context={'id_card': id_card}
        )

        return Response(
            {'code': 200, 'message': '获取成功', 'results': serializer.data},
            status=status.HTTP_200_OK
        )

    @action(detail=False, methods=['GET'], url_path='getSalaryDetail')
    def get_salary_detail(self, request):
        """
        获取指定年月的薪资详情
        参数：yearMonthId - 年月ID, idCard - 身份证号
        """
        year_month_id = request.query_params.get('yearMonthId', '').strip()
        id_card = request.query_params.get('idCard', '').strip()

        # 验证参数
        if not year_month_id or not id_card:
            return Response(
                {'code': 400, 'message': '请提供年月ID和身份证号'},
                status=status.HTTP_400_BAD_REQUEST
            )

        try:
            # 获取年月信息
            year_month = YearAndMonth.objects.get(id=year_month_id)
        except YearAndMonth.DoesNotExist:
            return Response(
                {'code': 404, 'message': '年月信息不存在'},
                status=status.HTTP_404_NOT_FOUND
            )

        # 获取应发工资数据
        yingfa = SalaryYingFa.objects.filter(
            year_month=year_month,
            shenfenzhenghao=id_card
        ).first()

        # 获取扣款数据
        koukuan = SalaryKouKuan.objects.filter(
            year_month=year_month,
            shenfenzhenghao=id_card
        ).first()

        # 构建返回数据
        data = {
            'yearMonth': {
                'id': str(year_month.id),
                'year': year_month.year,
                'month': year_month.month,
                'year_month': year_month.year_month,
                'beizhu': year_month.beizhu or ''
            },
            'yingfa': SalaryYingFaSerializer(yingfa).data if yingfa else None,
            'koukuan': SalaryKouKuanSerializer(koukuan).data if koukuan else None
        }

        return Response(
            {'code': 200, 'message': '获取成功', 'data': data},
            status=status.HTTP_200_OK
        )


class SalaryYingFaViewSet(ModelViewSet):
    permission_classes = (permissions.IsAuthenticatedOrReadOnly, )
    queryset = SalaryYingFa.objects.all()
    serializer_class = SalaryYingFaSerializer
    pagination_class = MyPageNumberPagination
    filterset_class = SalaryYingFaFilter

    @action(detail=False, methods=['POST'], url_path='deleteChecked')
    def delete_checked(self, request):
        # """批量删除应发工资"""
        # 从请求体中获取前端传入的 ID 数组
        ids = request.data.get('ids', [])

        # 校验：若未传 ID，返回 400 错误
        if not ids:
            return Response(
                {'code': 400, 'message': '请传入需要删除的 ID 数组'},
                status=status.HTTP_400_BAD_REQUEST
            )

        # 过滤出需要删除的对象（自动忽略不存在的 ID）
        to_delete = self.get_queryset().filter(id__in=ids)

        # 执行删除（返回删除的对象数量）
        deleted_count, _ = to_delete.delete()

        # 返回响应
        return Response(
            {'code': 200, 'message': f'成功删除 {deleted_count} 条数据'},
            status=status.HTTP_200_OK
        )

    @action(detail=False, methods=['POST'], url_path='importExcel')
    def import_excel(self, request):
        """导入Excel数据"""
        try:
            # 获取上传的文件
            excel_file = request.FILES.get('file')
            if not excel_file:
                return Response(
                    {'code': 400, 'message': '请上传Excel文件'},
                    status=status.HTTP_400_BAD_REQUEST
                )

            # 获取年月ID参数
            year_month_id = request.POST.get('year_month_id')
            if not year_month_id:
                return Response(
                    {'code': 400, 'message': '请先选择年月'},
                    status=status.HTTP_400_BAD_REQUEST
                )

            # 检查文件格式
            if not excel_file.name.endswith(('.xlsx', '.xls')):
                return Response(
                    {'code': 400, 'message': '文件格式错误,请上传Excel文件'},
                    status=status.HTTP_400_BAD_REQUEST
                )

            # 读取Excel文件,根据文件扩展名选择合适的引擎
            # 将需要保留前导零的字段设置为字符串类型
            dtype_dict = {
                '代发银行': str,
                '单位代码': str,
                '单位名称': str,
                '身份证号': str,
                '身份证号码': str
            }

            try:
                # 先尝试使用openpyxl读取
                df = pd.read_excel(excel_file, engine='openpyxl', dtype=dtype_dict)
            except Exception as e1:
                try:
                    # 如果失败,尝试使用xlrd读取
                    excel_file.seek(0)  # 重置文件指针
                    df = pd.read_excel(excel_file, engine='xlrd', dtype=dtype_dict)
                except Exception as e2:
                    return Response(
                        {'code': 400, 'message': f'Excel文件读取失败,请确保文件格式正确。错误信息: {str(e1)}'},
                        status=status.HTTP_400_BAD_REQUEST
                    )

            # Excel表头到数据库字段的映射
            field_mapping = {
                '身份证号': 'shenfenzhenghao',
                '身份证号码': 'shenfenzhenghao',  # 兼容"身份证号码"表头
                '姓名': 'xingming',
                '单位代码': 'danweidaima',
                '单位名称': 'danweimingcheng',
                '人员状况': 'renyuanzhuangkuang',
                '代发银行': 'daifayinhang',
                '执行时间': 'zhixingshijian',
                '岗位工资': 'gangweigongzi',
                '薪级工资': 'xinjigongzi',
                '保留津贴': 'baoliujintie',
                '教护龄津贴': 'jiaohulingjintie',
                '基础性绩效工资': 'jichuxingjixiaogongzi',
                '基础绩效奖': 'jichujixiaojiang',
                '住房补贴': 'zhufangbutie',
                '住房公积金': 'zhufanggongjijin',
                '独生费': 'dushengfei',
                '卫生费': 'weishengfei',
                '冬季取暖费': 'dongjiqunuanfei',
                '其他补发工资': 'qitabufagongzi',
                '临时工资': 'linshigongzi',
                '年终及考核优秀奖': 'nianzhongjikaoheyouxiujiang',
                '代扣住房公积金': 'daikouzhufanggongjijin',
                '补发工资': 'bufagongzi',
                '补发独生费': 'bufadushengfei',
                '应发工资': 'yingfagongzi',
                '实发工资': 'shifagongzhi',
            }

            success_count = 0
            error_count = 0
            error_messages = []

            # 遍历每一行数据
            for index, row in df.iterrows():
                try:
                    # 构建数据字典
                    data = {}
                    for excel_field, db_field in field_mapping.items():
                        if excel_field in df.columns:
                            value = row[excel_field]
                            # 处理空值
                            if pd.isna(value) or value == '':
                                if db_field in ['shenfenzhenghao', 'xingming', 'danweimingcheng',
                                               'renyuanzhuangkuang', 'daifayinhang', 'danweidaima']:
                                    data[db_field] = ''
                                elif db_field == 'zhixingshijian':
                                    data[db_field] = None
                                else:
                                    data[db_field] = 0
                            else:
                                # 处理日期字段
                                if db_field == 'zhixingshijian':
                                    if isinstance(value, str):
                                        try:
                                            data[db_field] = datetime.strptime(value, '%Y-%m-%d').date()
                                        except:
                                            data[db_field] = None
                                    else:
                                        data[db_field] = value
                                # 处理数值字段
                                elif db_field in ['gangweigongzi', 'xinjigongzi', 'baoliujintie',
                                                 'jiaohulingjintie', 'jichuxingjixiaogongzi',
                                                 'jichujixiaojiang', 'zhufangbutie', 'zhufanggongjijin',
                                                 'dushengfei', 'weishengfei', 'dongjiqunuanfei',
                                                 'qitabufagongzi', 'linshigongzi', 'nianzhongjikaoheyouxiujiang',
                                                 'daikouzhufanggongjijin', 'bufagongzi', 'bufadushengfei',
                                                 'yingfagongzi', 'shifagongzhi']:
                                    try:
                                        data[db_field] = float(value)
                                    except:
                                        data[db_field] = 0
                                else:
                                    data[db_field] = str(value)

                    # 添加年月外键ID
                    data['year_month_id'] = year_month_id

                    # 创建记录
                    SalaryYingFa.objects.create(**data)
                    success_count += 1

                except Exception as e:
                    error_count += 1
                    error_messages.append(f'第{index + 2}行导入失败: {str(e)}')

            # 返回导入结果
            return Response({
                'code': 200,
                'message': f'导入完成! 成功: {success_count}条, 失败: {error_count}条',
                'data': {
                    'success_count': success_count,
                    'error_count': error_count,
                    'error_messages': error_messages[:10]  # 只返回前10条错误信息
                }
            }, status=status.HTTP_200_OK)

        except Exception as e:
            return Response(
                {'code': 500, 'message': f'导入失败: {str(e)}'},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )


    @action(detail=False, methods=['GET'], url_path='getListByIdCard')
    def get_list_by_id_card(self, request):
        """通过身份证号获取应发工资数据"""
        id_card = request.query_params.get('idCard', '').strip()

        # 验证身份证号参数
        if not id_card:
            return Response(
                {'code': 400, 'message': '请提供身份证号'},
                status=status.HTTP_400_BAD_REQUEST
            )

        # 查询数据
        queryset = self.get_queryset().filter(shenfenzhenghao=id_card)

        # 使用序列化器序列化数据
        serializer = self.get_serializer(queryset, many=True)

        return Response(
            {'code': 200, 'message': '获取成功', 'data': serializer.data},
            status=status.HTTP_200_OK
        )


class SalaryKouKuanViewSet(ModelViewSet):
    permission_classes = (permissions.IsAuthenticatedOrReadOnly, )
    queryset = SalaryKouKuan.objects.all()
    serializer_class = SalaryKouKuanSerializer
    pagination_class = MyPageNumberPagination
    filterset_class = SalaryKouKuanFilter

    @action(detail=False, methods=['POST'], url_path='deleteChecked')
    def delete_checked(self, request):
        # """批量删除扣款"""
        # 从请求体中获取前端传入的 ID 数组
        ids = request.data.get('ids', [])

        # 校验：若未传 ID，返回 400 错误
        if not ids:
            return Response(
                {'code': 400, 'message': '请传入需要删除的 ID 数组'},
                status=status.HTTP_400_BAD_REQUEST
            )

        # 过滤出需要删除的对象（自动忽略不存在的 ID）
        to_delete = self.get_queryset().filter(id__in=ids)

        # 执行删除（返回删除的对象数量）
        deleted_count, _ = to_delete.delete()

        # 返回响应
        return Response(
            {'code': 200, 'message': f'成功删除 {deleted_count} 条数据'},
            status=status.HTTP_200_OK
        )

    @action(detail=False, methods=['POST'], url_path='importExcel')
    def import_excel(self, request):
        """导入Excel数据"""
        try:
            excel_file = request.FILES.get('file')
            if not excel_file:
                return Response({'code': 400, 'message': '请上传Excel文件'}, status=status.HTTP_400_BAD_REQUEST)

            year_month_id = request.POST.get('year_month_id')
            if not year_month_id:
                return Response({'code': 400, 'message': '请先选择年月'}, status=status.HTTP_400_BAD_REQUEST)

            if not excel_file.name.endswith(('.xlsx', '.xls')):
                return Response({'code': 400, 'message': '文件格式错误'}, status=status.HTTP_400_BAD_REQUEST)

            dtype_dict = {'身份证号': str}
            try:
                df = pd.read_excel(excel_file, engine='openpyxl', dtype=dtype_dict)
            except:
                excel_file.seek(0)
                df = pd.read_excel(excel_file, engine='xlrd', dtype=dtype_dict)

            field_mapping = {
                '姓名': 'xingming',
                '身份证号': 'shenfenzhenghao',
                '医疗保险': 'yiliaobaoxian',
                '养老保险': 'yanglaobaoxian',
                '职业年金': 'zhiyenianjin',
                '失业保险': 'shiyebaoxian',
                '个税': 'gerensuodeshui',
                '公积金': 'daikouzhufanggongjijin',
                '合计': 'heji',
            }

            success_count = 0
            error_count = 0
            error_messages = []

            for index, row in df.iterrows():
                try:
                    data = {}
                    for excel_field, db_field in field_mapping.items():
                        if excel_field in df.columns:
                            value = row[excel_field]
                            if pd.isna(value) or value == '':
                                data[db_field] = '' if db_field in ['shenfenzhenghao', 'xingming'] else 0
                            else:
                                data[db_field] = str(value) if db_field in ['shenfenzhenghao', 'xingming'] else float(value) if not pd.isna(value) else 0
                    data['year_month_id'] = year_month_id
                    SalaryKouKuan.objects.create(**data)
                    success_count += 1
                except Exception as e:
                    error_count += 1
                    error_messages.append(f'第{index + 2}行导入失败: {str(e)}')

            return Response({
                'code': 200,
                'message': f'导入完成! 成功: {success_count}条, 失败: {error_count}条',
                'data': {'success_count': success_count, 'error_count': error_count, 'error_messages': error_messages[:10]}
            }, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({'code': 500, 'message': f'导入失败: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def get_queryset(self):
        queryset = super().get_queryset()
        id_card = self.request.query_params.get('idCard', '').strip()
        if id_card:
            queryset = queryset.filter(idCard=id_card)
        return queryset
