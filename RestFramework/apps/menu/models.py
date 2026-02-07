from django.db import models

# Create your models here.

class Menu(models.Model):
    title = models.CharField(max_length=64, verbose_name="菜单名称")
    closable = models.BooleanField(default=True, verbose_name="是否可关闭")
    
    meta_id = models.CharField(max_length=64, blank=True, null=True, verbose_name="菜单meta_id")
    icon = models.CharField(max_length=64, blank=True, null=True, verbose_name="菜单图标")
    path = models.CharField(max_length=128, verbose_name="前端路由路径")
    parent = models.ForeignKey('self', null=True, blank=True, related_name='children', on_delete=models.CASCADE, verbose_name="父菜单")
    order = models.IntegerField(default=0, verbose_name="排序")
    describe = models.CharField(max_length=300, blank=True, null=True, verbose_name="菜单描述")

    
