from django.shortcuts import render,redirect
from .models import *
from django.conf import settings
# Create your views here.
def index(request):
    books_list = GoodsInfo.goods.get_books()[0:3]
    digital_list = GoodsInfo.goods.get_digital()[0:3]
    cloth_list = GoodsInfo.goods.get_cloth()[0:3]
    daily_list = GoodsInfo.goods.get_daily()[0:3]
    traffic_list = GoodsInfo.goods.get_traffic()[0:3]
    other_list = GoodsInfo.goods.get_other()[0:3]
    context = {'books_list':books_list, 'digital_list':digital_list, 'cloth_list':cloth_list, 'daily_list':daily_list, 'traffic_list':traffic_list, 'other_list':other_list}
    return render(request,'goods/index.html',context)

def books_list(request):
    books_list = GoodsInfo.goods.get_books()
    context = {'books_list':books_list}
    return render(request, 'goods/books_list.html', context)

def digital_list(request):
    digital_list = GoodsInfo.goods.get_digital()
    context = {'digital_list':digital_list}
    return render(request, 'goods/digital_list.html', context)

def cloth_list(request):
    cloth_list = GoodsInfo.goods.get_cloth()
    context = {'cloth_list':cloth_list}
    return render(request, 'goods/cloth_list.html', context)

def traffic_list(request):
    traffic_list = GoodsInfo.goods.get_traffic()
    context = {'traffic_list': traffic_list}
    return render(request, 'goods/traffic_list.html', context)

def daily_list(request):
    daily_list = GoodsInfo.goods.get_daily()
    context = {'daily_list': daily_list}
    return render(request, 'goods/daily_list.html', context)

def other_list(request):
    other_list = GoodsInfo.goods.get_other()
    context = {'other_list':other_list}
    return render(request, 'goods/other_list.html', context)

def release_goods(request):
    username = request.session.get('username')
    if username == None:
        context = {'error_msg': '请先登录'}
        return render(request, 'user/login.html', context)
    else:
        context = {}
        return render(request, 'goods/release_goods.html', context)

def release(request):
    post = request.POST
    title = post.get('title')
    type = post.get('type')
    price = post.get('price')
    address = post.get('address')
    # picture = post.get('picture')
    picture = request.FILES['picture']
    fname = '%s/goods/%s' % (settings.MEDIA_ROOT, picture.name)
    with open(fname, 'wb') as pic:
        for c in picture.chunks():
            pic.write(c)
    description = post.get('description')
    user_id = request.session.get('user_id')
    user = UserInfo.objects.filter(id=user_id)[0]
    GoodsInfo.goods.create_good(title,type,'goods/'+picture.name,price,address,description,user)
    return redirect('/')

def goods_details(request):
    title = request.GET['title']
    good = GoodsInfo.goods.get_title(title)[0]
    # user = UserInfo.objects.filter(id=good.user.id)[0]
    # user = UserInfo.objects.get(id(UserInfo),good.user)[0]
    context = {'good':good}
    return render(request, 'goods/goods_details.html', context)

def after_search(request):
    search_title = request.GET['search_title']
    goods = GoodsInfo.goods.filter(title__contains=search_title)
    print(goods)
    count = GoodsInfo.goods.filter(title__contains=search_title).count()
    print(count)
    context = {'goods':goods, 'search_title':search_title, 'count':count}
    return render(request, 'goods/after_search.html', context)