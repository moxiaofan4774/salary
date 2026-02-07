from django.db import models
import uuid
# Create your models here.
class YearAndMonth(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    year = models.IntegerField(verbose_name="年份")
    month = models.IntegerField(verbose_name="月份")
    year_month = models.CharField(verbose_name="年月",max_length=100,blank=True,null=True)
    #其它
    beizhu = models.TextField(verbose_name="备注",blank=True,null=True)

    class Meta:
        db_table = 'yearandmonth'
        ordering = ['-id']


class SalaryYingFa(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    year_month = models.ForeignKey(YearAndMonth, on_delete=models.CASCADE, verbose_name="年月",blank=True,null=True)

    shenfenzhenghao = models.CharField(verbose_name="身份证号",max_length=100,blank=True,null=True)
    xingming = models.CharField(verbose_name="姓名",max_length=100,blank=True,null=True)

    #应发项
    baoliujintie = models.FloatField(verbose_name="保留津贴",default=0)
    zhufangbutie = models.FloatField(verbose_name="住房补贴",default=0)
    zhufanggongjijin = models.FloatField(verbose_name="住房公积金",default=0)
    dushengfei = models.FloatField(verbose_name="独生费",default=0)
    weishengfei = models.FloatField(verbose_name="卫生费",default=0)
    gangweigongzi = models.FloatField(verbose_name="岗位工资",default=0)
    jiaohulingjintie = models.FloatField(verbose_name="教护龄津贴",default=0)
    xinjigongzi = models.FloatField(verbose_name="薪级工资",default=0)
    jichujixiaojiang = models.FloatField(verbose_name="基础绩效奖",default=0)
    jichuxingjixiaogongzi = models.FloatField(verbose_name="基础性绩效工资",default=0)
    dongjiqunuanfei = models.FloatField(verbose_name="冬季取暖费",default=0)
    qitabufagongzi = models.FloatField(verbose_name="其他补发工资",default=0)
    linshigongzi = models.FloatField(verbose_name="临时工资",default=0)
    nianzhongjikaoheyouxiujiang = models.FloatField(verbose_name="年终及考核优秀奖",default=0)

    #代扣缴费
    daikouzhufanggongjijin = models.FloatField(verbose_name="代扣住房公积金",default=0)

    #其它
    bufagongzi = models.FloatField(verbose_name="补发工资",default=0)
    bufadushengfei = models.FloatField(verbose_name="补发独生费",default=0)
    danweimingcheng = models.CharField(verbose_name="单位名称",max_length=100,blank=True,null=True)
    renyuanzhuangkuang = models.CharField(verbose_name="人员状况",max_length=100)
    daifayinhang = models.CharField(verbose_name="代发银行",max_length=100,blank=True,null=True)
    yingfagongzi = models.FloatField(verbose_name="应发工资",default=0)
    danweidaima = models.CharField(verbose_name="单位代码",max_length=100,blank=True,null=True)
    zhixingshijian = models.DateField(verbose_name="执行时间",blank=True,null=True)
    shifagongzhi = models.FloatField(verbose_name="实发工资",default=0)

    class Meta:
        db_table = 'salaryyingfa'
        ordering = ['-id']


class SalaryKouKuan(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    year_month = models.ForeignKey(YearAndMonth, on_delete=models.CASCADE, verbose_name="年月",blank=True,null=True)

    shenfenzhenghao = models.CharField(verbose_name="身份证号",max_length=100,blank=True,null=True)
    xingming = models.CharField(verbose_name="姓名",max_length=100,blank=True,null=True)
    
    #代扣缴费
    daikouzhufanggongjijin = models.FloatField(verbose_name="代扣住房公积金",default=0)
    yiliaobaoxian = models.FloatField(verbose_name="医疗保险",default=0)
    bujiaoyiliaobaoxian = models.FloatField(verbose_name="补缴医疗保险",default=0)
    yanglaobaoxian = models.FloatField(verbose_name="养老保险",default=0)
    bujiaoyanglao = models.FloatField(verbose_name="补缴养老",default=0)
    zhiyenianjin = models.FloatField(verbose_name="职业年金",default=0)
    bujiaonianjin = models.FloatField(verbose_name="补缴年金",default=0)
    shiyebaoxian = models.FloatField(verbose_name="失业保险",default=0)
    bujiaoshiye = models.FloatField(verbose_name="补缴失业",default=0)
    gerensuodeshui = models.FloatField(verbose_name="个人所得税",default=0)

    heji = models.FloatField(verbose_name="合计",default=0)
    
    class Meta:
        db_table = 'salarykoukuan'
        ordering = ['-id']


