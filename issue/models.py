from django.db import models
from datetime import datetime

# Create your models here.
class Issue(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    issue_header = models.CharField(max_length=50)
    issue_body = models.CharField(max_length=500)
    issue_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.first_name
