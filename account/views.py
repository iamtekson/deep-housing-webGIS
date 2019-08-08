from django.shortcuts import render, redirect
from django.contrib.auth import login, logout, authenticate
from django.contrib import auth, messages
from django.contrib.auth.models import User

# Create your views here.
def signin(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            print('i am login')
            messages.success(request, 'You are sucessfully login !')
            return redirect('/admin/')
        
        else:
            messages.error(request, "Invalid username or password !")
            return redirect('signin')
            print('I am inside else')
        
    else:
        return render(request, 'pages/login.html')
        print('I am outside else')
