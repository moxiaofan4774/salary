from django.urls import path
from rest_framework import routers
from rest_framework_simplejwt.views import TokenRefreshView,TokenObtainPairView,TokenVerifyView
from .views import LoginView, ChangePasswordView, UserViewSet, RoleViewSet, FrontLoginView, GetCasLoginUrlView,CASCallbackView

router = routers.DefaultRouter()

# 注册用户管理ViewSet
router.register(r'users', UserViewSet, basename='user')
router.register(r'roles', RoleViewSet, basename='roles')  # 角色API：/api/roles/

urlpatterns = [
    # 认证相关URL
    path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    # 下面这个是用来验证token的，根据需要进行配置
    path('token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('login/', LoginView.as_view(), name='login'),
    path('frontLogin/', FrontLoginView.as_view(), name='frontLogin'),
    path('change-password/', ChangePasswordView.as_view(), name='change_password'),

    path('get-cas-login-url/', GetCasLoginUrlView.as_view(), name='get-cas-login-url'),
    path('cas-callback/', CASCallbackView.as_view(), name='cas-callback'),

]
urlpatterns = urlpatterns + router.urls
