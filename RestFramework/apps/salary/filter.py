from django_filters import FilterSet, filters
from .models import SalaryYingFa, SalaryKouKuan
from django.contrib.auth.models import User


class SalaryYingFaFilter(FilterSet):

    shenfenzhenghao = filters.CharFilter(field_name='shenfenzhenghao', lookup_expr='icontains')  # 不区分大小写包含
    xingming = filters.CharFilter(field_name='xingming', lookup_expr='icontains')  # 不区分大小写包含
    year_month_id = filters.CharFilter(field_name='year_month', lookup_expr='exact')  # 按年月ID精确筛选（支持UUID）

    class Meta:
        model = SalaryYingFa
        fields = ['shenfenzhenghao', 'xingming']


class SalaryKouKuanFilter(FilterSet):

    shenfenzhenghao = filters.CharFilter(field_name='shenfenzhenghao', lookup_expr='icontains')  # 不区分大小写包含
    xingming = filters.CharFilter(field_name='xingming', lookup_expr='icontains')  # 不区分大小写包含
    year_month_id = filters.CharFilter(field_name='year_month', lookup_expr='exact')  # 按年月ID精确筛选（支持UUID）

    class Meta:
        model = SalaryKouKuan
        fields = ['shenfenzhenghao', 'xingming']