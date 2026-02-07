from rest_framework import serializers
from .models import UserInfo, Role
from apps.menu.serializers import MenuListSerializer
from ..menu.models import Menu


class UserSimpleSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserInfo
        fields = ['id', 'username']


class RoleSerializer(serializers.ModelSerializer):
    """角色序列化器（包含关联的菜单）"""
    menus = MenuListSerializer(many=True, read_only=True)
    menu_ids = serializers.PrimaryKeyRelatedField(
        many=True,
        queryset=Menu.objects.all(),
        write_only=True,
        source='menus',
        required=False,
        allow_empty=True
    )
    desc = serializers.CharField(source='describe', allow_blank=True, allow_null=True, required=False)
    user_count = serializers.SerializerMethodField()
    permission_count = serializers.SerializerMethodField()
    users = UserSimpleSerializer(many=True, read_only=True)

    class Meta:
        model = Role
        fields = [
            'id',
            'name',
            'code',
            'desc',
            'is_active',
            'menus',
            'menu_ids',
            'users',
            'user_count',
            'permission_count',
        ]

    def get_user_count(self, obj):
        return obj.users.count()

    def get_permission_count(self, obj):
        return obj.menus.count()

class LoginSerializer(serializers.Serializer):
    username = serializers.CharField(required=True)
    password = serializers.CharField(required=True)

class FrontLoginSerializer(serializers.Serializer):
    employeeId = serializers.CharField(required=True)
    password = serializers.CharField(required=True)


class UserInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserInfo
        fields = '__all__'


class ChangePasswordSerializer(serializers.Serializer):
    old_password = serializers.CharField(required=True, min_length=1, error_messages={
        'required': '请输入旧密码',
        'min_length': '密码不能为空'
    })
    new_password = serializers.CharField(required=True, min_length=6, error_messages={
        'required': '请输入新密码',
        'min_length': '新密码至少6个字符'
    })
    confirm_password = serializers.CharField(required=True, min_length=6, error_messages={
        'required': '请确认新密码',
        'min_length': '确认密码至少6个字符'
    })

    def validate(self, attrs):
        if attrs['new_password'] != attrs['confirm_password']:
            raise serializers.ValidationError('两次输入的新密码不一致')
        if attrs['old_password'] == attrs['new_password']:
            raise serializers.ValidationError('新密码不能与旧密码相同')
        return attrs


class UserAdminSerializer(serializers.ModelSerializer):
    """用户管理序列化器"""
    employeeId = serializers.CharField(required=True, allow_blank=False, error_messages={
        'required': '请输入工号',
        'blank': '工号不能为空',
    })
    idCard = serializers.CharField(required=True, allow_blank=False, error_messages={
        'required': '请输入身份证号',
        'blank': '身份证号不能为空',
    })
    username = serializers.CharField(required=True, allow_blank=False, error_messages={
        'required': '请输入用户名',
        'blank': '用户名不能为空',
    })
    email = serializers.EmailField(required=False, allow_blank=True, allow_null=True)
    telephone = serializers.CharField(required=False, allow_blank=True, allow_null=True)
    password = serializers.CharField(write_only=True, required=False, min_length=6,
                                     error_messages={'min_length': '密码至少6个字符'})

    class Meta:
        model = UserInfo
        fields = ['id', 'employeeId', 'username', 'idCard', 'email', 'telephone', 'is_active', 'is_superuser',
                  'is_staff', 'date_joined', 'password']
        read_only_fields = ['id', 'date_joined']

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        # 电话非必填，默认空字符串避免数据库非空约束
        validated_data.setdefault('telephone', '')
        user = UserInfo(**validated_data)
        if password:
            user.set_password(password)
        else:
            user.set_password('123456')  # 默认密码
        user.save()
        return user

    def update(self, instance, validated_data):
        password = validated_data.pop('password', None)
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        if password:
            instance.set_password(password)
        instance.save()
        return instance



