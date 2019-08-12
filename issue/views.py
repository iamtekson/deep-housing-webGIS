from django.shortcuts import render

# Create your views here.
def issue(request):
    if request.method == 'POST':
        first_name = request.POST['firstname']
        last_name = request.POST['lastname']
        issue_header = request.POST['issue_header']
        issue_body = request.POST['issue_body']

        issue = Issue()
        
    return render(request, 'pages/issue.html')