from django.shortcuts import render,redirect, HttpResponseRedirect
from django.contrib.auth.models import User
from django.contrib import auth
from .forms import Registerform
from .forms import loginform


# Create your views here.
def home (request):
    client_ip=request.session.get('client_ip')
    return render(request, 'home.html',{'client_ip':client_ip})


def register(request):
    if request.method=='POST':
        if request.POST['password1']==request.POST['password2']:
            try:
                User.objects.get(username=request.POST['name'])
                return render(request,'register.html',{'error':'Username already exists !!'})
            except :
                user=User.objects.create_user(request.POST['name'],password=request.POST['password1'])
                auth.login(request,user)
                return redirect('home')          

                
        else:
            f=Registerform()
            return render(request,'register.html',{'error':'Password does not match !!','form':f})
    else:
        f=Registerform()
        return render(request,'register.html',{'form':f})        
def login(request):
    if request.method=='POST':
        user=auth.authenticate(username=request.POST['name'],password=request.POST['password1'])
        if user is not None:
            auth.login(request,user)

            return redirect('home')
        else:
            f1=loginform()
            return render(request,'login.html',{'error':'Username or password is incorrect !!','form1':f1})
    else:
        
        f1=loginform()
        return render(request,'login.html',{'form1':f1}) 
def logout(request):
    if request.method=='POST':
        auth.logout(request)
        return redirect('home')    


