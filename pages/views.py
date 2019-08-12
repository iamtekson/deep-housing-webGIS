from django.shortcuts import render
from issue.models import Issue

# Create your views here.
def index(request):
    return render(request, 'pages/index.html')

def about(request):
    return render(request, 'pages/about.html')

def webmap(request):
    if request.method == 'POST':
        first_name = request.POST['firstname']
        last_name = request.POST['lastname']
        issue_header = request.POST['issue_header']
        issue_body = request.POST['issue_body']

        issue = Issue(first_name=first_name, last_name=last_name, issue_header=issue_header, issue_body=issue_body)
        issue.save()

        return render(request, 'pages/webmap.html')
    return render(request, 'pages/webmap.html')