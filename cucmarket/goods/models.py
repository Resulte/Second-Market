from django.db import models
from user.models import UserInfo

class GoodsInfoManager(models.Manager):
    def get_books(self):
        return super(GoodsInfoManager, self).get_queryset().filter(type='books',isDelete=False)
    def get_digital(self):
        return super(GoodsInfoManager, self).get_queryset().filter(type='digital',isDelete=False)
    def get_cloth(self):
        return super(GoodsInfoManager, self).get_queryset().filter(type='cloth',isDelete=False)
    def get_daily(self):
        return super(GoodsInfoManager, self).get_queryset().filter(type='daily',isDelete=False)
    def get_traffic(self):
        return super(GoodsInfoManager, self).get_queryset().filter(type='traffic',isDelete=False)
    def get_other(self):
        return super(GoodsInfoManager, self).get_queryset().filter(type='other',isDelete=False)
    def get_title(self, title):
        return super(GoodsInfoManager, self).get_queryset().filter(title=title,isDelete=False)
    def create_good(self, title, type, picture, price, address, description, user):
        book = self.create(title=title, type=type, picture=picture, price=price, address=address, description=description,user=user, isDelete=False)
        return book


# Create your models here.
class GoodsInfo(models.Model):
    title = models.CharField(max_length=20)  #名称
    type = models.CharField(max_length=20)  # 类型
    picture = models.ImageField(upload_to='goods')  #图片
    price = models.DecimalField(max_digits=10,decimal_places=2) #价格
    isDelete = models.BooleanField(default=False)  #删除
    address = models.CharField(max_length=100, default='', blank=True)  #交易地点
    description = models.CharField(max_length=300, default='', blank=True) #描述
    user = models.ForeignKey(UserInfo) #商家Id
    goods = GoodsInfoManager()
    def __str__(self):
        return self.title