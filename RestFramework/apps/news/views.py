from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions
from .models import Banner, CategoryGroup
from .serializers import BannerListSerializer, CategoryGroupSerializer
from django.http import JsonResponse
import os
import uuid
from django.conf import settings
from .models import Category
from .serializers import CategorySerializer, CategoryCreateSerializer, ArticleSerializer
from .filter import ArticleFilter
from .paginations import MyPageNumberPagination
from rest_framework.decorators import action
from rest_framework import status
from .models import Article


class BannerViewSet(ModelViewSet):
    permission_classes = (permissions.IsAuthenticatedOrReadOnly, )
    queryset = Banner.objects.all()
    serializer_class = BannerListSerializer


class CategoryGroupViewSet(ModelViewSet):
    queryset = CategoryGroup.objects.all()
    serializer_class = CategoryGroupSerializer


class CategoryViewSet(ModelViewSet):
    permission_classes = (permissions.IsAuthenticatedOrReadOnly, )
    queryset = Category.objects.order_by('-order')

    def get_serializer_class(self):
        if self.action in ['create', 'update', 'partial_update']:
            return CategoryCreateSerializer
        return CategorySerializer

    def list(self, request, *args, **kwargs):
        # 只返回顶级分类
        queryset = self.filter_queryset(self.get_queryset().filter(parent=None))
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


class ArticleListViewSet(ModelViewSet):
    """文章管理视图集"""
    permission_classes = (permissions.IsAuthenticatedOrReadOnly, )
    queryset = Article.objects.all().order_by('-id')
    
    serializer_class = ArticleSerializer
    
    filterset_class = ArticleFilter
    search_fields = ['title',]
    pagination_class = MyPageNumberPagination

    @action(detail=False, methods=['POST'], url_path='deleteChecked')
    def delete_checked(self, request):
        # """批量删除文章"""
        # 从请求体中获取前端传入的 ID 数组
        ids = request.data.get('ids', [])

        # 校验：若未传 ID，返回 400 错误
        if not ids:
            return Response(
                {'error': '请传入需要删除的 ID 数组'},
                status=status.HTTP_400_BAD_REQUEST
            )

        # 过滤出需要删除的对象（自动忽略不存在的 ID）
        to_delete = self.get_queryset().filter(id__in=ids)

        # 执行删除（返回删除的对象数量）
        deleted_count, _ = to_delete.delete()

        # 返回响应
        return Response(
            {'message': f'成功删除 {deleted_count} 条数据'},
            status=status.HTTP_200_OK
        )

    @action(detail=False, methods=['GET'], url_path='byCategory')
    def by_category(self, request):
        """根据分类获取文章列表"""
        category_uuid = request.query_params.get('category_uuid')
        if category_uuid:
            queryset = self.get_queryset().filter(category__uuid=category_uuid)
        else:
            queryset = self.get_queryset()
        
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)





def upload_pic(request):
    """图片上传接口"""
    file = request.FILES.get('file')
    _, file_ext = os.path.splitext(file.name)
    name = uuid.uuid4().hex+file_ext
    with open(os.path.join(settings.MEDIA_ROOT, 'upload/' + name), 'wb') as fp:
        for chunk in file.chunks():
            fp.write(chunk)
    # url = request.build_absolute_uri(settings.MEDIA_URL+name)
    # url = settings.MEDIA_URL + 'upload/' + name
    # 生成可访问的绝对路径 URL
    # 1. 拼接相对路径（基于 MEDIA_URL）
    relative_url = os.path.join('upload/', name)
    # 2. 生成绝对 URL（包含协议、域名、端口等）
    # absolute_url = request.build_absolute_uri(settings.MEDIA_URL + relative_url)
    absolute_url = settings.MEDIA_URL + relative_url
    print(absolute_url)
    return JsonResponse({"errno":0,"data": {"url":absolute_url}})