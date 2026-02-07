from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_role'),
    ]

    operations = [
        migrations.AddField(
            model_name='role',
            name='code',
            field=models.CharField(blank=True, max_length=64, null=True, unique=True, verbose_name='角色编码'),
        ),
        migrations.AddField(
            model_name='role',
            name='is_active',
            field=models.BooleanField(default=True, verbose_name='是否启用'),
        ),
        migrations.AddField(
            model_name='userinfo',
            name='roles',
            field=models.ManyToManyField(blank=True, related_name='users', to='user.role', verbose_name='角色'),
        ),
    ]
