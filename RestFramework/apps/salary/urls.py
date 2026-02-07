from rest_framework.routers import DefaultRouter
from .views import YearAndMonthViewSet,SalaryYingFaViewSet,SalaryKouKuanViewSet
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

router = DefaultRouter()
router.register(r'yearAndMonth', YearAndMonthViewSet, basename='yearAndMonth') 
router.register(r'salaryYingFa', SalaryYingFaViewSet, basename='salaryYingFa') 
router.register(r'salaryKouKuan', SalaryKouKuanViewSet, basename='salaryKouKuan') 
urlpatterns = [
    path('', include(router.urls)), 
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)