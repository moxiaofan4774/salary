from rest_framework import serializers
from .models import UserInfo, Role, Department, TitleCategory, EmployeeProfile, EmployeeTitleHistory, OperationLog
from apps.menu.serializers import MenuListSerializer
from apps.menu.models import Menu


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


class OperationLogSerializer(serializers.ModelSerializer):
    """操作日志序列化器"""
    operator_username = serializers.CharField(source='operator.username', read_only=True)
    action_display = serializers.CharField(source='get_action_display', read_only=True)

    class Meta:
        model = OperationLog
        fields = [
            'id', 'operator', 'operator_username', 'operator_name',
            'action', 'action_display', 'resource_type', 'resource_id',
            'resource_name', 'ip_address', 'created_at'
        ]
        read_only_fields = ['id', 'created_at']


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


class DepartmentSerializer(serializers.ModelSerializer):
    parent_name = serializers.CharField(source='parent.name', read_only=True)
    employee_count = serializers.SerializerMethodField()

    class Meta:
        model = Department
        fields = ['id', 'name', 'parent', 'parent_name', 'order',
                  'is_active', 'description', 'employee_count']

    def get_employee_count(self, obj):
        """获取该部门的员工数量"""
        return obj.employees.count()


class TitleCategorySerializer(serializers.ModelSerializer):
    """职称分类序列化器"""
    parent_name = serializers.CharField(source='parent.name', read_only=True)
    title_count = serializers.SerializerMethodField()

    class Meta:
        model = TitleCategory
        fields = ['id', 'name', 'parent', 'parent_name', 'order',
                  'is_active', 'description', 'title_count', 'created_at']

    def get_title_count(self, obj):
        """获取该分类下的职称数量"""
        return obj.employee_titles.filter(is_current=True).count()


class EmployeeProfileSerializer(serializers.ModelSerializer):
    """员工档案序列化器"""
    department_name = serializers.CharField(source='department.name', read_only=True)
    username = serializers.CharField(source='user.username', read_only=True)
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    gender_display = serializers.CharField(source='get_gender_display', read_only=True)

    class Meta:
        model = EmployeeProfile
        fields = [
            'id', 'user', 'username', 'employeeId', 'realName', 'idCard',
            'gender', 'gender_display', 'birth_date', 'department', 'department_name',
            'telephone', 'email', 'address', 'entry_date', 'status', 'status_display',
            'remark', 'created_at', 'updated_at'
        ]
        read_only_fields = ['id', 'created_at', 'updated_at']

    def validate_employeeId(self, value):
        """验证工号唯一性"""
        instance = self.instance
        if instance:
            # 编辑时排除自己
            if EmployeeProfile.objects.exclude(id=instance.id).filter(employeeId=value).exists():
                raise serializers.ValidationError('该工号已存在')
        else:
            # 新增时检查
            if EmployeeProfile.objects.filter(employeeId=value).exists():
                raise serializers.ValidationError('该工号已存在')
        return value

    def validate_idCard(self, value):
        """验证身份证号唯一性"""
        instance = self.instance
        if instance:
            if EmployeeProfile.objects.exclude(id=instance.id).filter(idCard=value).exists():
                raise serializers.ValidationError('该身份证号已存在')
        else:
            if EmployeeProfile.objects.filter(idCard=value).exists():
                raise serializers.ValidationError('该身份证号已存在')
        return value


class EmployeeTitleHistorySerializer(serializers.ModelSerializer):
    """员工职称历史序列化器"""
    employee_name = serializers.CharField(source='employee.realName', read_only=True)
    employee_id = serializers.CharField(source='employee.employeeId', read_only=True)
    title_name = serializers.CharField(source='title_category.name', read_only=True)
    duration = serializers.SerializerMethodField()

    class Meta:
        model = EmployeeTitleHistory
        fields = [
            'id', 'employee', 'employee_name', 'employee_id',
            'title_category', 'title_name', 'start_date', 'end_date',
            'is_current', 'duration', 'certificate_number', 'remark',
            'created_at', 'updated_at'
        ]
        read_only_fields = ['id', 'created_at', 'updated_at']

    def get_duration(self, obj):
        """计算职称持续时间（年）"""
        from datetime import date
        end = obj.end_date if obj.end_date else date.today()
        delta = end - obj.start_date
        years = delta.days / 365.25
        return round(years, 1)

    def validate(self, attrs):
        """验证开始日期和结束日期"""
        from datetime import date

        start_date = attrs.get('start_date')
        end_date = attrs.get('end_date')

        if end_date and start_date and end_date < start_date:
            raise serializers.ValidationError('结束日期不能早于开始日期')

        # 验证同一员工的职称时间不能重叠
        employee = attrs.get('employee')
        if employee:
            queryset = EmployeeTitleHistory.objects.filter(employee=employee)
            if self.instance:
                queryset = queryset.exclude(id=self.instance.id)

            for history in queryset:
                # 检查时间重叠
                history_end = history.end_date if history.end_date else date.today()
                current_end = end_date if end_date else date.today()

                if not (current_end < history.start_date or start_date > history_end):
                    raise serializers.ValidationError(
                        f'职称时间与已有记录重叠: {history.title_category.name} '
                        f'({history.start_date} 至 {history.end_date or "至今"})'
                    )

        return attrs

