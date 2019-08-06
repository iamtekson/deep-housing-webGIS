from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, 'pages/index.html')

def about(request):
    return render(request, 'pages/about.html')

def webmap(request):
    return render(request, 'pages/webmap.html')