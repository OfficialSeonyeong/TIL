from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from .models import *

# Create your views here.

def index(request):
    categories=Category.objects.all()
    restaurants=Restaurant.objects.all()
    content={'categories':categories, 'restaurants': restaurants}
    return render(request, 'shareRes/index.html', content)

def restaurantDetail(request):
    return render(request, 'shareRes/restaurantDetail.html')

def restaurantCreate(request):
    categories = Category.objects.all()
    content = {'categories':categories}
    return render(request, "shareRes/restaurantCreate.html", content)

def Create_restaurant(request):
    category_id = request.POST['resCategory']
    category = Category.objects.get(id=category_id)
    name=request.POST['resTitle']
    link = request.POST['resLink']
    content = request.POST['resContent']
    keyword = request.POST['resLoc']
    new_res=Restaurant(category=category, restaurant_name=name, restaurant_link=link,restaurant_content=content, restaurant_keyword=keyword)
    new_res.save()
    return redirect('index')

def restaurantDetail(request,id):
    restaurant = Restaurant.objects.get(id=id)
    content = {'restaurant': restaurant}
    return render(request, 'shareRes/restaurantDetail.html',content)

def restaurantUpdate(request, id):
    categories=Category.objects.all()
    restaurant=Restaurant.objects.get(id=id)
    content={'categories':categories, 'restaurant':restaurant}
    return render(request,'shareRes/restaurantUpdate.html',content)

def Update_restaurant(request):
    id=request.POST['resId']
    restaurant = Restaurant.objects.get(id=id)
    restaurant.restaurant_name = request.POST['resTitle']
    restaurant.restaurant_link = request.POST['resLink']
    restaurant.restaurant_content = request.POST['resContent']
    restaurant.restaurant_keyword = request.POST['resLoc']
    restaurant.save()
    return HttpResponseRedirect(reverse('resDetailPage', kwargs={'id':id}))

def Delete_restaurant(request):
    id = request.POST['resId']
    restaurant = Restaurant.objects.get(id=id)
    restaurant.delete()
    return redirect('index')

def categoryCreate(request):
    categories = Category.objects.all()
    content={'categories':categories}
    return render(request, "shareRes/categoryCreate.html", content)

def Create_category(request):
    category_name = request.POST['categoryName']
    new_category = Category(category_name=category_name)
    new_category.save()
    return HttpResponseRedirect(reverse('index'))

def Delete_category(request):
    category_id = request.POST['categoryId']
    delete_category=Category.objects.get(id=category_id)
    delete_category.delete()
    return redirect('cateCreatePage')