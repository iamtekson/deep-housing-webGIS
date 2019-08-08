from django.db import models
from django.contrib.gis.db import models as gis_model

# Create your models here.
class Boundary(models.Model):
    gid = models.AutoField(primary_key=True)
    area = models.FloatField(blank=True, null=True)
    geom = gis_model.MultiPolygonField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'boundary'


class Boundarybuilding(models.Model):
    gid = models.AutoField(primary_key=True)
    geom = gis_model.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'boundarybuilding'