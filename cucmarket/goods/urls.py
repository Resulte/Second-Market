from django.conf.urls import url
from . import views



urlpatterns = [
    url(r'^$', views.index),
    url(r'^books_list/$',views.books_list),
    url(r'^digital_list/$',views.digital_list),
    url(r'^cloth_list/$',views.cloth_list),
    url(r'^traffic_list/$',views.traffic_list),
    url(r'^daily_list/$',views.daily_list),
    url(r'^other_list/$',views.other_list),
    url(r'^release_goods/$',views.release_goods),
    url(r'^release/$',views.release),
    url(r'^goods_details/$',views.goods_details),
    url(r'^after_search/$',views.after_search),
]