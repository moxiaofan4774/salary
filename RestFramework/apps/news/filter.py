from django_filters import FilterSet, filters
from .models import Article
from django.contrib.auth.models import User


class ArticleFilter(FilterSet):
    """文章过滤器"""
    title = filters.CharFilter(field_name='title', lookup_expr='icontains')  # 不区分大小写包含
    category = filters.UUIDFilter(field_name='category__uuid')  # 根据分类UUID过滤
    author = filters.UUIDFilter(field_name='author__uuid')  # 根据作者UUID过滤
    is_check = filters.BooleanFilter()  # 审核状态过滤
    is_top = filters.BooleanFilter()  # 置顶状态过滤
    is_hot = filters.BooleanFilter()  # 热门状态过滤
    is_delete = filters.BooleanFilter()  # 删除状态过滤

    class Meta:
        model = Article
        fields = ['title', 'category', 'author', 'is_check', 'is_top', 'is_hot', 'is_delete']