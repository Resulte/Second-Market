from django.contrib import admin
from .models import *
# Register your models here.
class GoodsInfoAdmin(admin.ModelAdmin):
    list_per_pag=15
    list_display = ['id','title','type','picture','price','address','description']
    list_filter = ['title']
    search_fields = ['title']

admin.site.register(GoodsInfo, GoodsInfoAdmin)