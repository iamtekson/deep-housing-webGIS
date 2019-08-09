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

class Drainage(models.Model):
    gid = models.AutoField(primary_key=True)
    geom = gis_model.MultiLineStringField(blank=True, null=True)
    widht_mm = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'drainage'


class DrainageOutletValve(models.Model):
    gid = models.AutoField(primary_key=True)
    geom = gis_model.PointField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'drainage_outlet_valve'


class Park(models.Model):
    gid = models.AutoField(primary_key=True)
    geom = gis_model.MultiPolygonField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'park'


class Road(models.Model):
    gid = models.AutoField(primary_key=True)
    road_type = models.CharField(max_length=50, blank=True, null=True)
    road_typ_1 = models.CharField(max_length=50, blank=True, null=True)
    geom = gis_model.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'road'


class Sanitary(models.Model):
    gid = models.AutoField(primary_key=True)
    type = models.CharField(max_length=30, blank=True, null=True)
    pipe_mat = models.CharField(max_length=50, blank=True, null=True)
    diamr_mm_field = models.IntegerField(db_column='diamr_mm_', blank=True, null=True)  # Field renamed because it ended with '_'.
    trench_dep = models.CharField(max_length=50, blank=True, null=True)
    geom = gis_model.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sanitary'


class SanitaryJunctionPoint(models.Model):
    gid = models.AutoField(primary_key=True)
    junction_p = models.CharField(max_length=50, blank=True, null=True)
    geom = gis_model.PointField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sanitary_junction_point'

class Street(models.Model):
    gid = models.AutoField(primary_key=True)
    power_watt = models.IntegerField(blank=True, null=True)
    pol_height = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=50, blank=True, null=True)
    geom = gis_model.PointField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'street'


class Swimmingpool(models.Model):
    gid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, blank=True, null=True)
    geom = gis_model.MultiPolygonField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'swimmingpool'


class Temple(models.Model):
    gid = models.AutoField(primary_key=True)
    geom = gis_model.MultiPolygonField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'temple'


class WaterNetwork(models.Model):
    gid = models.AutoField(primary_key=True)
    line_type = models.CharField(max_length=50, blank=True, null=True)
    pip_dia_in = models.FloatField(blank=True, null=True)
    geom = gis_model.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'water_network'


class Electrical(models.Model):
    gid = models.AutoField(primary_key=True)
    line_type = models.CharField(max_length=50, blank=True, null=True)
    material = models.CharField(max_length=50, blank=True, null=True)
    diameter = models.IntegerField(blank=True, null=True)
    phase_c_field = models.FloatField(db_column='phase_c_', blank=True, null=True)  # Field renamed because it ended with '_'.
    diameter_c = models.IntegerField(blank=True, null=True)
    material_c = models.CharField(max_length=50, blank=True, null=True)
    geom = gis_model.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'electrical'


class House(models.Model):
    gid = models.AutoField(primary_key=True)
    house_type = models.CharField(max_length=50, blank=True, null=True)
    area_sq_m_field = models.BigIntegerField(db_column='area_sq_m_', blank=True, null=True)  # Field renamed because it ended with '_'.
    curr_resid = models.CharField(max_length=50, blank=True, null=True)
    permanent = models.CharField(max_length=50, blank=True, null=True)
    plot_no = models.BigIntegerField(blank=True, null=True)
    geom = gis_model.MultiPolygonField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'house'

        