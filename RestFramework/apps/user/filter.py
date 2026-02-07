from django_filters import FilterSet, filters
from .models import Department


class DepartmentFilter(FilterSet):
    name = filters.CharFilter(field_name='name', lookup_expr='icontains')  # 不区分大小写包含
    is_active = filters.BooleanFilter(field_name='is_active', lookup_expr='exact')
    class Meta:
        model = Department
        fields = ['name', 'is_active']