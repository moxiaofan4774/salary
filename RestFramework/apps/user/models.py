
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


