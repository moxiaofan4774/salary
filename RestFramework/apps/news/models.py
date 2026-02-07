from django.db import models
import uuid


class CategoryGroup(models.Model):
    id=models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True)
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'categorygroup'


class Category(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, primary_key=True)
    name = models.CharField(max_length=20, null=False, blank=False, default='')
    order = models.IntegerField(default=1)
    desc = models.CharField(max_length=500, null=True, blank=True)
    parent = models.ForeignKey('self', on_delete=models.CASCADE, related_name='children', null=True, blank=True, default=None)
    group = models.ForeignKey('CategoryGroup', on_delete=models.CASCADE, null=True, blank=True, default=None)

    class Meta:
        ordering = ['-order']
        db_table = 'category'

    def __str__(self):
        return self.name

# Create your models here.
class Banner(models.Model):
    name = models.CharField(max_length=20, null=True, blank=True)
    order = models.IntegerField(default=1, null=True, blank=True)
    pic = models.CharField(max_length=500, null=True, blank=True)
    is_show = models.BooleanField(default=True, null=True, blank=True)
    link_url = models.CharField(max_length=300, null=True, blank=True)
    desc = models.CharField(max_length=300, null=True, blank=True)

    class Meta:
        ordering = ['-order']
        db_table = 'banner'

    def __str__(self):
        return self.name


class Article(models.Model):
    title = models.CharField(max_length=200)
    pic = models.CharField(max_length=500, null=True, blank=True)
    content = models.TextField(null=True, blank=True)
    create_date = models.DateTimeField(auto_now_add=True)
    category = models.ForeignKey('Category', on_delete=models.SET_NULL, null=True, blank=True)
    author = models.ForeignKey('user.UserInfo', on_delete=models.SET_NULL, null=True, blank=True)
    out_link = models.CharField(max_length=500, null=True, blank=True)
    is_check = models.BooleanField(default=True)
    is_top = models.BooleanField(default=False)
    is_hot = models.BooleanField(default=False)
    hits = models.IntegerField(default=0)
    is_delete = models.BooleanField(default=False)

    class Meta:
        ordering = ['is_check', '-is_top', '-create_date']
        db_table = 'article'

    def __str__(self):
        return self.title