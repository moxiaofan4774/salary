"""
测试关键字匹配爬虫功能
"""
import os
import django
import asyncio

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'RestFramework.settings')
django.setup()

from apps.scan.async_spider import execute_spider_task
from apps.scan.models import ScanUrl, SensitiveKeyword, ScanTask, ScanResult

async def test_keyword_spider():
    """测试关键字匹配爬虫"""

    print("=" * 80)
    print("测试关键字匹配爬虫功能")
    print("=" * 80)

    # 1. 检查地址管理中的URL
    scan_urls = list(ScanUrl.objects.all())
    print(f"\n1. 地址管理中的URL数量: {len(scan_urls)}")
    for url in scan_urls[:5]:
        print(f"   - {url.url} ({url.title})")

    # 2. 检查敏感词
    keywords = list(SensitiveKeyword.objects.filter(is_active=True))
    print(f"\n2. 启用的敏感词数量: {len(keywords)}")
    for kw in keywords[:5]:
        print(f"   - {kw.keyword} ({kw.category})")

    # 3. 执行爬虫任务
    print("\n3. 开始执行爬虫任务...")
    task_name = "测试关键字扫描"

    spider_config = {
        'max_concurrent': 5,
        'timeout': 30,
        'max_depth': 2,
        'max_pages_per_site': 20
    }

    result = await execute_spider_task(task_name, **spider_config)

    print("\n4. 任务执行结果:")
    print(f"   - 成功: {result.get('success')}")
    print(f"   - 消息: {result.get('message')}")

    if result.get('success'):
        stats = result.get('statistics', {})
        print(f"   - 总扫描页面数: {stats.get('total_pages')}")
        print(f"   - 命中关键字次数: {stats.get('total_matched')}")
        print(f"   - 耗时: {stats.get('duration')}")

        # 5. 查看保存的结果
        task = ScanTask.objects.filter(word=task_name).first()
        if task:
            scan_results = ScanResult.objects.filter(scantask=task)
            print(f"\n5. 保存的匹配结果数量: {scan_results.count()}")
            for sr in scan_results[:3]:
                print(f"\n   URL: {sr.url}")
                print(f"   结果预览: {sr.scanResultText[:200]}...")

    print("\n" + "=" * 80)
    print("测试完成！")
    print("=" * 80)

if __name__ == '__main__':
    asyncio.run(test_keyword_spider())
