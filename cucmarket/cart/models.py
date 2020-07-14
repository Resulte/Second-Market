from django.db import models
from user.models import UserInfo
from goods.models import GoodsInfo

# Create your models here.
class CartInfo(models.Model):
    title = models.CharField(max_length=20,default='')  #名称
    type = models.CharField(max_length=20,default='')  # 类型
    picture = models.ImageField(upload_to='goods',default='')  #图片
    number = models.CharField(max_length=20,default='1')  # 数量
    price = models.DecimalField(max_digits=10,decimal_places=2,default='') #价格
    buyer = models.ForeignKey(UserInfo) # 买家Id
    good = models.ForeignKey(GoodsInfo)  # 商品Id