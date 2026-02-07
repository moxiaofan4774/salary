from rest_framework.pagination import PageNumberPagination

class MyPageNumberPagination(PageNumberPagination):
    page_size = 20
    page_size_query_param = 'pageSize'
    page_query_param = 'pageNum'