from django.db import models
from django.contrib.gis.db import models as gis_model

# Create your models here.
class Sewer(models.Model):
    gid = models.IntegerField()
    type = models.CharField(max_length=50, blank=True, null=True)
    pipe_type = models.CharField(max_length=50, blank=True, null=True)
    p_diam_mm_field = models.BigIntegerField(db_column='p_diam_mm_', blank=True, null=True)  # Field renamed because it ended with '_'.
    geom = gis_model.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sewer'