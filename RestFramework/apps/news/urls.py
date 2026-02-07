from django.urls import path,include
from rest_framework.routers import DefaultRouter
from .views import BannerViewSet, upload_pic, CategoryViewSet, ArticleListViewSet, CategoryGroupViewSet
from django.conf.urls.static import static
from django.conf import settings


router = DefaultRouter()
router.register(r'banners', BannerViewSet, basename='banners')
router.register(r'categories', CategoryViewSet, basename='categories')
router.register(r'articles', ArticleListViewSet, basename='articles')
router.register(r'categoryGroup', CategoryGroupViewSet, basename='categoryGroup')
urlpatterns = [
    # 认证相关URL
    # path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('', include(router.urls)),
    path('upload_pic/', upload_pic, name='upload_pic'),
 
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


urlpatterns = urlpatterns + router.urls
