from django.shortcuts import render
from .models import Issue

# Create your views here.
def issue(request):
    selector = Issue.objects.all()
    context = {
        'issue': selector
    }
        
    return render(request, 'pages/issue.html', context)