from rest_framework import serializers
from .models import YearAndMonth,SalaryYingFa,SalaryKouKuan

class YearAndMonthSerializer(serializers.ModelSerializer):
    class Meta:
        model = YearAndMonth
        fields = '__all__'


class YearAndMonthWithSalarySerializer(serializers.ModelSerializer):
    """
    年月序列化器（包含用户薪资数据）
    用于前台用户查看自己的薪资列表
    """
    income = serializers.SerializerMethodField(read_only=True)  # 应发工资
    daikouzhufanggongjijin = serializers.SerializerMethodField(read_only=True)  # 代扣公积金
    deduction = serializers.SerializerMethodField(read_only=True)  # 扣缴合计
    netSalary = serializers.SerializerMethodField(read_only=True)  # 实发工资
    yearLabel = serializers.SerializerMethodField(read_only=True)  # 年份标签
    monthLabel = serializers.SerializerMethodField(read_only=True)  # 月份标签

    class Meta:
        model = YearAndMonth
        fields = ['id', 'year', 'month', 'year_month', 'income', 'daikouzhufanggongjijin',
                  'deduction', 'netSalary', 'yearLabel', 'monthLabel']

    def get_income(self, obj):
        """获取实发工资（SalaryYingFa.shifagongzhi）"""
        id_card = self.context.get('id_card')
        if not id_card:
            return 0

        try:
            yingfa = SalaryYingFa.objects.filter(
                year_month=obj,
                shenfenzhenghao=id_card
            ).first()
            return yingfa.shifagongzhi if yingfa else 0
        except:
            return 0

    def get_daikouzhufanggongjijin(self, obj):
        """获取代扣公积金（SalaryYingFa.daikouzhufanggongjijin）"""
        id_card = self.context.get('id_card')
        if not id_card:
            return 0

        try:
            yingfa = SalaryYingFa.objects.filter(
                year_month=obj,
                shenfenzhenghao=id_card
            ).first()
            return yingfa.daikouzhufanggongjijin if yingfa else 0
        except:
            return 0

    def get_deduction(self, obj):
        """获取扣缴合计（SalaryKouKuan.heji）"""
        id_card = self.context.get('id_card')
        if not id_card:
            return 0

        try:
            koukuan = SalaryKouKuan.objects.filter(
                year_month=obj,
                shenfenzhenghao=id_card
            ).first()
            return koukuan.heji if koukuan else 0
        except:
            return 0

    def get_netSalary(self, obj):
        """计算实发工资（SalaryYingFa.shifagongzhi - SalaryKouKuan.heji）"""
        income = self.get_income(obj)
        deduction = self.get_deduction(obj)
        return income - deduction

    def get_yearLabel(self, obj):
        """获取年份标签"""
        return f"{obj.year}年"

    def get_monthLabel(self, obj):
        """获取月份标签"""
        return f"{obj.month}月"

class SalaryYingFaSerializer(serializers.ModelSerializer):
    # 添加只读字段，用于显示年月详细信息
    year_month_display = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = SalaryYingFa
        fields = '__all__'

    def get_year_month_display(self, obj):
        """获取年月的显示信息"""
        if obj.year_month:
            return {
                'id': obj.year_month.id,
                'year': obj.year_month.year,
                'month': obj.year_month.month,
                'year_month': obj.year_month.year_month
            }
        return None


class SalaryKouKuanSerializer(serializers.ModelSerializer):
    class Meta:
        model = SalaryKouKuan
        fields = '__all__'
