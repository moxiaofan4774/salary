"""
Test script to verify local keyword scanning functionality
"""
import os
import django
import re

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'RestFramework.settings')
django.setup()

from apps.scan.models import SensitiveKeyword

def test_local_keyword_scan(content):
    """Test the local keyword scan logic"""
    if not content or not content.strip():
        return {
            'success': True,
            'data': {
                'Label': 'Normal',
                'Suggestion': 'Pass',
                'Score': 0,
                'Keywords': []
            }
        }

    # 从数据库读取敏感词
    sensitive_keywords = SensitiveKeyword.objects.filter(is_active=True)

    # 检测敏感词
    matched_keywords = []
    highest_score = 0
    label = 'Normal'
    suggestion = 'Pass'

    for kw in sensitive_keywords:
        # 使用正则表达式进行不区分大小写的匹配
        pattern = re.compile(re.escape(kw.keyword), re.IGNORECASE)
        if pattern.search(content):
            matched_keywords.append({
                'Keyword': kw.keyword,
                'Label': kw.label,
                'Score': kw.score,
                'Suggestion': kw.suggestion
            })
            if kw.score > highest_score:
                highest_score = kw.score
                label = kw.label
                suggestion = kw.suggestion

    return {
        'success': True,
        'data': {
            'Label': label,
            'Suggestion': suggestion,
            'Score': highest_score,
            'Keywords': matched_keywords
        }
    }

# Test cases
test_cases = [
    ("这是一个正常的文本", "Normal text"),
    ("这是一个包含色情内容的文本", "Contains porn keyword"),
    ("法轮功是邪教组织", "Contains polity keyword"),
    ("", "Empty content"),
    ("   ", "Whitespace only"),
    ("这个av视频很暴力", "Multiple keywords"),
]

print("=" * 80)
print("Testing Local Keyword Scan Functionality")
print("=" * 80)
print(f"\nTotal keywords in database: {SensitiveKeyword.objects.count()}")
print("\nActive keywords by category:")
for category in SensitiveKeyword.objects.values('category').distinct():
    count = SensitiveKeyword.objects.filter(category=category['category'], is_active=True).count()
    print(f"  {category['category']}: {count} keywords")

print("\n" + "=" * 80)
print("Running Test Cases")
print("=" * 80)

for content, description in test_cases:
    print(f"\nTest: {description}")
    print(f"Content: '{content}'")
    result = test_local_keyword_scan(content)
    print(f"Result:")
    print(f"  Label: {result['data']['Label']}")
    print(f"  Suggestion: {result['data']['Suggestion']}")
    print(f"  Score: {result['data']['Score']}")
    if result['data']['Keywords']:
        print(f"  Matched Keywords ({len(result['data']['Keywords'])}):")
        for kw in result['data']['Keywords']:
            print(f"    - {kw['Keyword']} (Label: {kw['Label']}, Score: {kw['Score']})")
    else:
        print(f"  Matched Keywords: None")

print("\n" + "=" * 80)
print("All tests completed!")
print("=" * 80)
