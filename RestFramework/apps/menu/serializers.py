from rest_framework import serializers
from .models import Menu


class MenuListSerializer(serializers.ModelSerializer):
    """分类列表序列化器（简化版，不包含递归嵌套）"""
    class Meta:
        model = Menu
        fields = '__all__'


class MenuSerializer(serializers.ModelSerializer):
    """带递归子菜单的序列化器"""
    children = serializers.SerializerMethodField()

    def get_children(self, obj):
        queryset = obj.children.all()
        allowed_ids = self.context.get('allowed_menu_ids')
        if allowed_ids is not None:
            queryset = queryset.filter(id__in=allowed_ids)
        queryset = queryset.order_by('-order')
        if not queryset:
            return []
        return MenuSerializer(queryset, many=True, context=self.context).data

    class Meta:
        model = Menu
        fields = (
            'id',
            'title',
            'order',
            'describe',
            'meta_id',
            'icon',
            'path',
            'closable',
            'parent',
            'children',
        )


class MenuCreateUpdateSerializer(serializers.ModelSerializer):
    """创建/更新分类时使用的简化序列化器"""
    class Meta:
        model = Menu
        fields = '__all__'
        extra_kwargs = {'parent': {'required': False, 'allow_null': True}}
