"""
验证扫描结果历史保留功能
"""
import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'RestFramework.settings')
django.setup()

from apps.scan.models import ScanResult, ScanTask

def verify_history_feature():
    """验证历史记录功能"""
    print("=" * 80)
    print("验证扫描结果历史保留功能")
    print("=" * 80)

    # 1. 检查数据库字段
    print("\n1. 检查 ScanResult 模型是否有 ctime 字段:")
    try:
        # 尝试查询一条记录
        result = ScanResult.objects.first()
        if result:
            print(f"   ✓ ctime 字段存在")
            print(f"   示例记录:")
            print(f"     - ID: {result.id}")
            print(f"     - URL: {result.url}")
            print(f"     - 扫描时间: {result.ctime}")
        else:
            print(f"   ⚠ 数据库中暂无扫描结果记录")
    except Exception as e:
        print(f"   ✗ 字段检查失败: {str(e)}")
        return

    # 2. 统计每个任务的扫描记录数
    print("\n2. 统计各任务的扫描记录数:")
    tasks = ScanTask.objects.all()
    for task in tasks:
        count = ScanResult.objects.filter(scantask=task).count()
        print(f"   任务: {task.word} (ID: {task.id})")
        print(f"   └── 扫描记录数: {count} 条")

        # 显示该任务的最近5条记录
        recent_results = ScanResult.objects.filter(scantask=task).order_by('-ctime')[:5]
        if recent_results:
            print(f"   └── 最近5条记录:")
            for r in recent_results:
                print(f"       - {r.ctime.strftime('%Y-%m-%d %H:%M:%S')} | {r.url[:50]}...")

    # 3. 检查是否有重复的URL（同一URL在不同时间的记录）
    print("\n3. 检查历史记录特性（同一URL的多次扫描）:")
    from django.db.models import Count
    duplicate_urls = ScanResult.objects.values('url', 'scantask').annotate(
        count=Count('id')
    ).filter(count__gt=1).order_by('-count')[:5]

    if duplicate_urls:
        print("   找到多次扫描的URL（历史记录功能正常）:")
        for item in duplicate_urls:
            url = item['url']
            scantask_id = item['scantask']
            count = item['count']
            task = ScanTask.objects.get(id=scantask_id)
            print(f"\n   URL: {url}")
            print(f"   任务: {task.word}")
            print(f"   扫描次数: {count}")

            # 显示该URL的所有扫描时间
            records = ScanResult.objects.filter(url=url, scantask_id=scantask_id).order_by('-ctime')
            print(f"   扫描时间列表:")
            for r in records:
                print(f"     - {r.ctime.strftime('%Y-%m-%d %H:%M:%S')}")
    else:
        print("   ⚠ 未找到重复URL，可能还没有进行多次扫描")

    # 4. 统计总记录数
    print("\n4. 数据库统计:")
    total_results = ScanResult.objects.count()
    total_tasks = ScanTask.objects.count()
    print(f"   总任务数: {total_tasks}")
    print(f"   总扫描记录数: {total_results}")

    # 5. 按日期统计
    print("\n5. 按日期统计扫描记录数:")
    from django.db.models.functions import TruncDate
    daily_stats = ScanResult.objects.annotate(
        date=TruncDate('ctime')
    ).values('date').annotate(
        count=Count('id')
    ).order_by('-date')[:7]

    if daily_stats:
        for stat in daily_stats:
            print(f"   {stat['date']}: {stat['count']} 条记录")
    else:
        print("   暂无数据")

    print("\n" + "=" * 80)
    print("验证完成！")
    print("=" * 80)
    print("\n功能说明:")
    print("- ✓ 扫描结果会永久保留在数据库中")
    print("- ✓ 每次扫描都会添加新记录，不会删除旧记录")
    print("- ✓ 同一URL可能有多条记录（不同时间的扫描）")
    print("- ✓ 可以通过扫描时间(ctime)追溯历史记录")
    print("\n建议:")
    print("- 定期清理不需要的历史数据")
    print("- 使用 '批量删除' 功能管理旧记录")
    print("- 考虑为 ctime 字段添加数据库索引以提高查询性能")

if __name__ == '__main__':
    verify_history_feature()
