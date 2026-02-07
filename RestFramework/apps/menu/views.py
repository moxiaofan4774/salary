from rest_framework import viewsets, permissions, status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from apps.menu.models import Menu
from apps.menu.serializers import MenuSerializer, MenuCreateUpdateSerializer
from apps.user.models import UserInfo


class MenuViewSet(viewsets.ModelViewSet):
    """菜单管理 CURD"""
    queryset = Menu.objects.order_by('-order')
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_serializer_class(self):
        if self.action in ['create', 'update', 'partial_update']:
            return MenuCreateUpdateSerializer
        return MenuSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset().filter(parent=None))
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


class UserMenuView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user_id = request.query_params.get('user_id')
        target_user = request.user

        if user_id and str(request.user.id) != user_id:
            if not request.user.is_superuser:
                return Response({'detail': '无权查看其他用户菜单'}, status=status.HTTP_403_FORBIDDEN)
            target_user = UserInfo.objects.filter(id=user_id).first()
            if not target_user:
                return Response({'detail': '用户不存在'}, status=status.HTTP_404_NOT_FOUND)

        if target_user.is_superuser:
            root_menus = Menu.objects.filter(parent=None).order_by('-order')
            serializer = MenuSerializer(root_menus, many=True)
            return Response(serializer.data)

        user_roles = target_user.roles.all()
        if not user_roles.exists():
            return Response([])

        allowed_menus = Menu.objects.filter(roles__in=user_roles).distinct().select_related('parent')
        visible_ids = set(allowed_menus.values_list('id', flat=True))

        for menu in allowed_menus:
            parent = menu.parent
            while parent:
                visible_ids.add(parent.id)
                parent = parent.parent

        root_menus = Menu.objects.filter(parent=None, id__in=visible_ids).order_by('-order')
        serializer = MenuSerializer(
            root_menus,
            many=True,
            context={'allowed_menu_ids': visible_ids},
        )
        return Response(serializer.data)
