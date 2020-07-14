from django.conf.urls import url
from . import views



urlpatterns = [
    url(r'^login/$', views.login),
    url(r'^register/$',views.register),
    url(r'^register_handle/$',views.register_handle),
    url(r'^login_handle/$',views.login_handle),
    url(r'^logout/$',views.logout),
    url(r'^user_center/$',views.user_center),
    url(r'^reset_password/$',views.reset_password),
    url(r'^release_records/$',views.release_records),
    url(r'^purchase_record/$',views.purchase_record),
    url(r'^collection/$',views.collection),
    url(r'^browse_history/$',views.browse_history),
    url(r'^c_password/$',views.c_password),
    url(r'^logon_record/$',views.logon_record),
    url(r'^cart/$',views.cart),
    url(r'^delete_cart/$',views.delete_cart),
]