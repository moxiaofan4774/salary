"""
Script to populate initial sensitive keywords into database
Usage: python manage.py shell < populate_keywords.py
"""
import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'RestFramework.settings')
django.setup()

from apps.scan.models import SensitiveKeyword

# Initial sensitive keywords data
initial_keywords = [
    # 色情类
    {'category': '色情', 'keyword': '色情', 'label': 'Porn', 'suggestion': 'Block', 'score': 100},
    {'category': '色情', 'keyword': '黄色', 'label': 'Porn', 'suggestion': 'Block', 'score': 95},
    {'category': '色情', 'keyword': '裸体', 'label': 'Porn', 'suggestion': 'Block', 'score': 100},
    {'category': '色情', 'keyword': '性爱', 'label': 'Porn', 'suggestion': 'Block', 'score': 100},
    {'category': '色情', 'keyword': 'av', 'label': 'Porn', 'suggestion': 'Block', 'score': 90},

    # 政治类
    {'category': '政治', 'keyword': '法轮功', 'label': 'Polity', 'suggestion': 'Block', 'score': 100},
    {'category': '政治', 'keyword': '六四', 'label': 'Polity', 'suggestion': 'Block', 'score': 100},
    {'category': '政治', 'keyword': '天安门', 'label': 'Polity', 'suggestion': 'Review', 'score': 80},
    {'category': '政治', 'keyword': '台独', 'label': 'Polity', 'suggestion': 'Block', 'score': 100},
    {'category': '政治', 'keyword': '藏独', 'label': 'Polity', 'suggestion': 'Block', 'score': 100},

    # 暴力类
    {'category': '暴力', 'keyword': '杀人', 'label': 'Violence', 'suggestion': 'Block', 'score': 100},
    {'category': '暴力', 'keyword': '爆炸', 'label': 'Violence', 'suggestion': 'Block', 'score': 95},
    {'category': '暴力', 'keyword': '恐怖', 'label': 'Violence', 'suggestion': 'Review', 'score': 85},
    {'category': '暴力', 'keyword': '屠杀', 'label': 'Violence', 'suggestion': 'Block', 'score': 100},
    {'category': '暴力', 'keyword': '血腥', 'label': 'Violence', 'suggestion': 'Review', 'score': 80},

    # 违法犯罪类
    {'category': '违法犯罪', 'keyword': '毒品', 'label': 'Illegal', 'suggestion': 'Block', 'score': 100},
    {'category': '违法犯罪', 'keyword': '赌博', 'label': 'Illegal', 'suggestion': 'Block', 'score': 95},
    {'category': '违法犯罪', 'keyword': '诈骗', 'label': 'Illegal', 'suggestion': 'Block', 'score': 95},
    {'category': '违法犯罪', 'keyword': '洗钱', 'label': 'Illegal', 'suggestion': 'Block', 'score': 95},
    {'category': '违法犯罪', 'keyword': '走私', 'label': 'Illegal', 'suggestion': 'Block', 'score': 90},

    # 辱骂类
    {'category': '辱骂', 'keyword': '傻逼', 'label': 'Abuse', 'suggestion': 'Block', 'score': 90},
    {'category': '辱骂', 'keyword': '操你妈', 'label': 'Abuse', 'suggestion': 'Block', 'score': 100},
    {'category': '辱骂', 'keyword': '去死', 'label': 'Abuse', 'suggestion': 'Review', 'score': 85},
    {'category': '辱骂', 'keyword': '废物', 'label': 'Abuse', 'suggestion': 'Review', 'score': 70},
    {'category': '辱骂', 'keyword': '垃圾', 'label': 'Abuse', 'suggestion': 'Review', 'score': 65},
]

# Clear existing keywords (optional)
print("Clearing existing sensitive keywords...")
SensitiveKeyword.objects.all().delete()

# Insert new keywords
print("Inserting initial sensitive keywords...")
created_count = 0
for kw_data in initial_keywords:
    keyword, created = SensitiveKeyword.objects.get_or_create(
        keyword=kw_data['keyword'],
        defaults={
            'category': kw_data['category'],
            'label': kw_data['label'],
            'suggestion': kw_data['suggestion'],
            'score': kw_data['score'],
            'is_active': True
        }
    )
    if created:
        created_count += 1
        print(f"  Created: {keyword.keyword} ({keyword.category})")
    else:
        print(f"  Already exists: {keyword.keyword}")

print(f"\nTotal created: {created_count}/{len(initial_keywords)} keywords")
print("Done!")
