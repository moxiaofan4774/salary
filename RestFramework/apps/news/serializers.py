from rest_framework import serializers
from .models import Banner, CategoryGroup
from .models import Category
from .models import Article
from apps.user.serializers import UserInfoSerializer

class BannerListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Banner
        fields = '__all__'


class CategoryGroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = CategoryGroup
        fields = '__all__'


class CategorySerializer(serializers.ModelSerializer):
    # 递归序列化子类：children 是父类关联的子类集合（由 related_name='children' 定义）
    children = serializers.SerializerMethodField()
    def get_children(self, obj):
        # obj.children 是父类关联的所有子类（Django 自动通过 ForeignKey 的 related_name 生成）
        return CategorySerializer(obj.children.all(), many=True).data
    class Meta:
        model = Category
        #  需包含的字段：模型字段 + 自定义的 children 字段
        fields = ('uuid', 'name', 'order', 'desc', 'parent', 'children', 'group')

class CategoryCreateSerializer(serializers.ModelSerializer):
    # 创建分类时，不需要传递 parent 字段，因为 parent 是外键，需要先创建父类，再创建子类
    class Meta:
        model = Category
        fields = '__all__'
        # 允许 parent 字段为 null（顶级分类）
        extra_kwargs = {'parent': {'required': False, 'allow_null': True}}


class CategoryListSerializer(serializers.ModelSerializer):
    """分类列表序列化器（简化版，不包含递归嵌套）"""
    class Meta:
        model = Category
        fields = ['uuid', 'name', 'order', 'desc', 'parent', 'group']

class ArticleSerializer(serializers.ModelSerializer):
    """文章序列化器（读写合一）

    写入时：接收 category 和 author 的 ID (UUID)
    读取时：返回完整的 category 和 author 对象信息
    """

    class Meta:
        model = Article
        fields = "__all__"
        extra_kwargs = {
            'category': {'required': False, 'allow_null': True},
            'author': {'required': False, 'allow_null': True}
        }

    def to_representation(self, instance):
        """自定义输出格式：读取时返回嵌套对象"""
        representation = super().to_representation(instance)

        # 如果 category 存在，则返回完整的分类信息
        if instance.category:
            representation['category'] = CategoryListSerializer(instance.category).data

        # 如果 author 存在，则返回完整的作者信息
        if instance.author:
            representation['author'] = UserInfoSerializer(instance.author).data

        return representation