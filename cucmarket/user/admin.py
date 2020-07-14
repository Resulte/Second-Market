from django.contrib import admin
from user.models import UserInfo
# Register your models here.
class UserInfoAdmin(admin.ModelAdmin):
    list_per_pag=15
    list_display = ['id','username','password','number']
    list_filter = ['username']
    search_fields = ['username']
admin.site.register(UserInfo, UserInfoAdmin)