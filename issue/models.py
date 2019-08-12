from django.db import models
from django.contrib.gis.db import models as gis_model
from datetime import datetime

# Create your models here.
class Issue(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    issue_header = models.CharField(max_length=50)
    issue_body = models.CharField(max_length=5000)
    issue_date = models.DateTimeField(auto_now_add=True)
    lat = models.FloatField()
    lng = models.FloatField()
    location = gis_model.PointField(srid=4326, blank=True, null=True)

    def __str__(self):
        return self.first_name
