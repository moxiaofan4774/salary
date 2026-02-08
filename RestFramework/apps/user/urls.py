from django.urls import path
from rest_framework import routers
from rest_framework_simplejwt.views import TokenRefreshView,TokenObtainPairView,TokenVerifyView
from .views import LoginView, ChangePasswordView, UserViewSet, RoleViewSet, FrontLoginView, GetCasLoginUrlView,CASCallbackView, DepartmentViewSet, TitleCategoryViewSet, EmployeeProfileViewSet, EmployeeTitleHistoryViewSet, OperationLogViewSet

router = routers.DefaultRouter()

# 注册用户管理ViewSet
router.register(r'users', UserViewSet, basename='user')
router.register(r'roles', RoleViewSet, basename='roles')  # 角色API：/api/roles/
router.register(r'departments', DepartmentViewSet, basename='departments')  # 部门API：/api/departments/
router.register(r'title-categories', TitleCategoryViewSet, basename='title-categories')  # 职称分类API：/api/title-categories/
router.register(r'employee-profiles', EmployeeProfileViewSet, basename='employee-profiles')  # 员工档案API：/api/employee-profiles/
router.register(r'employee-title-history', EmployeeTitleHistoryViewSet, basename='employee-title-history')  # 员工职称历史API：/api/employee-title-history/
router.register(r'operation-logs', OperationLogViewSet, basename='operation-logs')  # 操作日志API：/api/operation-logs/

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
