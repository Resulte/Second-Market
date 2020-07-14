from django.shortcuts import render,redirect
from django.http import JsonResponse,HttpResponseRedirect
from hashlib import sha1
from .models import *
from goods.models import GoodsInfo
from cart.models import CartInfo

# Create your views here.
def login(request):
    uname = request.COOKIES.get('uname','')
    context = {'uname' : uname}
    return render(request,'user/login.html',context)

def login_handle(request):
    post = request.POST
    number = post.get('number')
    password = post.get('password')
    users = UserInfo.objects.filter(number=number)
    print(number)
    if len(users) == 1:
        s1 = sha1()
        s1.update(password.encode('utf8'))
        if s1.hexdigest() == users[0].password:
            red = HttpResponseRedirect('/')
            request.session['user_id'] = users[0].id
            request.session['number'] = number
            request.session['username'] = users[0].username
            return red
        else:
            context = {'title': '用户登录', 'number': number, 'password': password, 'error_msg':'密码错误'}
            return render(request, 'user/login.html', context)
    else:
        context = {'title': '用户登录',  'number': number, 'password': password, 'error_msg':'学号错误'}

        return render(request, 'user/login.html', context)

def logout(request):
    request.session.flush()
    return redirect('/')

def register(request):
    context = {}
    return render(request,'user/register.html',context)

def register_handle(request):
    post = request.POST
    username = post.get('username')
    password = post.get('password')
    password2 = post.get('password2')
    number = post.get('number')
    if password != password2:
        return redirect('/user/register/')
    s1 = sha1()
    s1.update(password.encode('utf8'))
    upwd3 = s1.hexdigest()
    user = UserInfo()
    user.username = username
    user.password = upwd3
    user.number = number
    user.save()
    return redirect('/user/login')

def user_center(request):
    username = request.session.get('username')
    if username == None:
        context = { 'error_msg': '请先登录'}
        return render(request, 'user/login.html', context)
    else:
        user = UserInfo.objects.filter(username=username)[0]
        context = {'user': user}
        return render(request, 'user/user_center.html', context)

def reset_password(request):
    context = {}
    return render(request,'user/reset_password.html',context)

def release_records(request):
    context = {}
    return render(request,'user/release_records.html',context)

def purchase_record(request):
    context = {}
    return render(request,'user/purchase_record.html',context)

def collection(request):
    context = {}
    return render(request,'user/collection.html',context)

def browse_history(request):
    context = {}
    return render(request,'user/browse_history.html',context)

def c_password(request):
    context = {}
    return render(request,'user/c_password.html',context)

def logon_record(request):
    context = {}
    return render(request,'user/logon_record.html',context)

def cart(request):
    username = request.session.get('username')
    if username == None:
        context = {'error_msg': '请先登录'}
        return render(request, 'user/login.html', context)
    else:
        title = request.GET['title']
        good = GoodsInfo.goods.get_title(title)[0]
        user = UserInfo.objects.filter(username=username)[0]
        cart = CartInfo.objects.create(title=good.title,type=good.type,picture=good.picture,price=good.price,buyer=user, good=good)
        cart.save()
        carts = CartInfo.objects.filter(buyer=user)
        total_price = 0
        total = 0
        for c in carts:
            total = total + 1
            total_price = total_price +c.price
        context = {'carts': carts, 'total_price':total_price, 'total':total}
        return render(request,'user/cart.html',context)


def delete_cart(request):
    title = request.GET['title']
    cart = CartInfo.objects.filter(title=title)[0]
    print(cart)
    cart.delete()
    username = request.session.get('username')
    user = UserInfo.objects.filter(username=username)[0]
    carts = CartInfo.objects.filter(buyer=user)
    total_price = 0
    total = 0
    for c in carts:
        total = total + 1
        total_price = total_price + c.price
    context = {'carts': carts, 'total_price': total_price, 'total': total}
    return render(request, 'user/cart.html', context)