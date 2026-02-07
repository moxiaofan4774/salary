from rest_framework.routers import DefaultRouter
from .views import MenuViewSet,UserMenuView
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

router = DefaultRouter()
router.register(r'menus', MenuViewSet, basename='menus') 

urlpatterns = [
    path('', include(router.urls)), 
    path('user-menus/', UserMenuView.as_view(), name='user-menus'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)