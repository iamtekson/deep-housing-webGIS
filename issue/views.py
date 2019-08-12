from django.shortcuts import render

# Create your views here.
def issue(request):
    return render(request, 'pages/issue.html')