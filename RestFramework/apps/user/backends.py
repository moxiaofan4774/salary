from django.contrib.auth.backends import ModelBackend
from .models import UserInfo


class EmployeeIdBackend(ModelBackend):
    """
    自定义认证后端，支持使用工号(employeeId)登录
    """
    def authenticate(self, request, employeeId=None, password=None, **kwargs):
        try:
            # 通过工号查找用户
            user = UserInfo.objects.get(employeeId=employeeId)
            # 验证密码
            if user.check_password(password):
                return user
        except UserInfo.DoesNotExist:
            return None
        return None

    def get_user(self, user_id):
        try:
            return UserInfo.objects.get(pk=user_id)
        except UserInfo.DoesNotExist:
            return None
