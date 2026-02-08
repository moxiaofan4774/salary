
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser,PermissionsMixin
from django.db import models
import uuid

from apps.menu.models import Menu


# Create your models here.
class UserManager(BaseUserManager):
    def _create_user(self, username, password, **kwargs):

        if not username:
            raise ValueError("请传入用户名！")
        if not password:
            raise ValueError("请传入密码！")
        user = self.model(username=username, **kwargs)
        user.set_password(password)
        user.save()
        return user

    def create_user(self, username, password, **kwargs):
        kwargs['is_superuser'] = False
        return self._create_user(username, password, **kwargs)

    def create_superuser(self, username, password, **kwargs):
        kwargs['is_superuser'] = True
        kwargs['is_staff'] = True
        return self._create_user(username, password, **kwargs)


class Role(models.Model):
    name = models.CharField(max_length=64, verbose_name="角色名称")
    code = models.CharField(max_length=64, blank=True, null=True, unique=True, verbose_name="角色编码")
    describe = models.CharField(max_length=300, blank=True, null=True, verbose_name="角色描述")
    is_active = models.BooleanField(default=True, verbose_name="是否启用")
    menus = models.ManyToManyField(Menu, related_name='roles', blank=True, verbose_name="菜单")

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'role'
        ordering = ['-id']


class UserInfo(AbstractBaseUser,PermissionsMixin):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    employeeId = models.CharField(max_length=100, null=True, verbose_name="工号")
    idCard = models.CharField(max_length=18, null=True, verbose_name="身份证号")
    telephone = models.CharField(max_length=11)
    # 由于CAS系统只能传入username，所以这里需要将username和employeeId关联起来
    username = models.CharField(max_length=100, blank=False, null=False, unique=True)
    email = models.EmailField(null=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)  # 超级用户标志
    date_joined = models.DateTimeField(auto_now_add=True)
    perm = models.CharField(max_length=50, null=True)
    roles = models.ManyToManyField(Role, related_name='users', blank=True, verbose_name="角色")

    
    
    # 覆盖 PermissionsMixin 的字段以避免反向关系名称冲突
    groups = models.ManyToManyField(
        'auth.Group',
        verbose_name='groups',
        blank=True,
        help_text='The groups this user belongs to.',
        related_name='userinfo_set',
        related_query_name='userinfo',
    )
    user_permissions = models.ManyToManyField(
        'auth.Permission',
        verbose_name='user permissions',
        blank=True,
        help_text='Specific permissions for this user.',
        related_name='userinfo_set',
        related_query_name='userinfo',
    )

    objects = UserManager()  # 关键：使用自定义管理器

    USERNAME_FIELD = 'username'

    class Meta:
        db_table = 'userinfo'
        ordering = ['-id']

    def __str__(self):
        return self.username

    @property
    def is_active_user(self):
        """检查用户是否为活跃用户"""
        return self.is_active


class Department(models.Model):
    """部门字典表"""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=100, unique=True, verbose_name="部门名称")  # 如：中文系
    parent = models.ForeignKey(
        'self',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='children',
        verbose_name="上级部门"
    )
    order = models.IntegerField(default=0, verbose_name="排序")
    is_active = models.BooleanField(default=True, verbose_name="是否启用")
    description = models.CharField(max_length=300, null=True, blank=True, verbose_name="描述")

    class Meta:
        db_table = 'department'
        ordering = ['order', 'id']
        verbose_name = "部门"
        verbose_name_plural = "部门"

    def __str__(self):
        return self.name


class TitleCategory(models.Model):
    """职称分类表（支持多级分类）"""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=100, unique=True, verbose_name="分类名称")
    parent = models.ForeignKey(
        'self',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='children',
        verbose_name="上级分类"
    )
    order = models.IntegerField(default=0, verbose_name="排序")
    is_active = models.BooleanField(default=True, verbose_name="是否启用")
    description = models.CharField(max_length=300, null=True, blank=True, verbose_name="描述")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        db_table = 'title_category'
        ordering = ['order', 'id']
        verbose_name = "职称分类"
        verbose_name_plural = "职称分类"

    def __str__(self):
        return self.name

    @property
    def level(self):
        """动态计算层级"""
        level = 1
        parent = self.parent
        while parent:
            level += 1
            parent = parent.parent
        return level


class EmployeeProfile(models.Model):
    """员工档案表"""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.OneToOneField(
        UserInfo,
        on_delete=models.CASCADE,
        related_name='profile',
        verbose_name="关联用户"
    )
    employeeId = models.CharField(max_length=100, unique=True, verbose_name="工号")
    realName = models.CharField(max_length=100, verbose_name="真实姓名")
    idCard = models.CharField(max_length=18, unique=True, verbose_name="身份证号")
    gender = models.CharField(
        max_length=10,
        choices=[('male', '男'), ('female', '女')],
        null=True,
        blank=True,
        verbose_name="性别"
    )
    birth_date = models.DateField(null=True, blank=True, verbose_name="出生日期")
    department = models.ForeignKey(
        Department,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='employees',
        verbose_name="所属部门"
    )
    telephone = models.CharField(max_length=11, null=True, blank=True, verbose_name="联系电话")
    email = models.EmailField(null=True, blank=True, verbose_name="邮箱")
    address = models.CharField(max_length=300, null=True, blank=True, verbose_name="家庭住址")
    entry_date = models.DateField(null=True, blank=True, verbose_name="入职日期")
    status = models.CharField(
        max_length=20,
        choices=[
            ('active', '在职'),
            ('leave', '离职'),
            ('retire', '退休')
        ],
        default='active',
        verbose_name="员工状态"
    )
    remark = models.TextField(null=True, blank=True, verbose_name="备注")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        db_table = 'employee_profile'
        ordering = ['-created_at']
        verbose_name = "员工档案"
        verbose_name_plural = "员工档案"

    def __str__(self):
        return f"{self.employeeId} - {self.realName}"


class EmployeeTitleHistory(models.Model):
    """员工职称历史表"""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    employee = models.ForeignKey(
        EmployeeProfile,
        on_delete=models.CASCADE,
        related_name='title_history',
        verbose_name="员工"
    )
    title_category = models.ForeignKey(
        TitleCategory,
        on_delete=models.PROTECT,
        related_name='employee_titles',
        verbose_name="职称分类"
    )
    start_date = models.DateField(verbose_name="开始日期")
    end_date = models.DateField(null=True, blank=True, verbose_name="结束日期")
    is_current = models.BooleanField(default=False, verbose_name="是否当前职称")
    certificate_number = models.CharField(max_length=100, null=True, blank=True, verbose_name="证书编号")
    remark = models.TextField(null=True, blank=True, verbose_name="备注")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        db_table = 'employee_title_history'
        ordering = ['-start_date', '-created_at']
        verbose_name = "员工职称历史"
        verbose_name_plural = "员工职称历史"
        indexes = [
            models.Index(fields=['employee', 'is_current']),
            models.Index(fields=['start_date', 'end_date']),
        ]

    def __str__(self):
        return f"{self.employee.realName} - {self.title_category.name} ({self.start_date})"

    def save(self, *args, **kwargs):
        """保存时自动处理当前职称逻辑"""
        if self.is_current:
            # 如果设置为当前职称，将该员工的其他职称记录设置为非当前
            EmployeeTitleHistory.objects.filter(
                employee=self.employee,
                is_current=True
            ).exclude(id=self.id).update(is_current=False)
        super().save(*args, **kwargs)


class OperationLog(models.Model):
    """操作日志表"""
    ACTION_CHOICES = [
        ('CREATE', '创建'),
        ('UPDATE', '更新'),
        ('DELETE', '删除'),
        ('RETRIEVE', '查询'),
    ]

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    operator = models.ForeignKey(
        UserInfo,
        on_delete=models.SET_NULL,
        null=True,
        related_name='operation_logs',
        verbose_name="操作人"
    )
    operator_name = models.CharField(max_length=100, verbose_name="操作人姓名")
    action = models.CharField(max_length=20, choices=ACTION_CHOICES, verbose_name="操作类型")
    resource_type = models.CharField(max_length=50, verbose_name="资源类型")
    resource_id = models.CharField(max_length=100, verbose_name="资源ID")
    resource_name = models.CharField(max_length=200, verbose_name="资源名称")
    ip_address = models.GenericIPAddressField(null=True, blank=True, verbose_name="IP地址")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="操作时间")

    class Meta:
        db_table = 'operation_log'
        ordering = ['-created_at']
        verbose_name = "操作日志"
        verbose_name_plural = "操作日志"
        indexes = [
            models.Index(fields=['operator', 'created_at']),
            models.Index(fields=['action', 'created_at']),
            models.Index(fields=['resource_type', 'created_at']),
        ]

    def __str__(self):
        return f"{self.operator_name} {self.get_action_display()} {self.resource_type} - {self.created_at}"

