# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.contrib.gis.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Boundary(models.Model):
    gid = models.AutoField(primary_key=True)
    area = models.FloatField(blank=True, null=True)
    geom = models.MultiPolygonField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'boundary'


class Boundarybuilding(models.Model):
    gid = models.AutoField(primary_key=True)
    geom = models.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'boundarybuilding'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Drainage(models.Model):
    gid = models.AutoField(primary_key=True)
    line_type = models.CharField(max_length=50, blank=True, null=True)
    p_dia_mm = models.IntegerField(blank=True, null=True)
    geom = models.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'drainage'


class Electrical(models.Model):
    gid = models.AutoField(primary_key=True)
    line_type = models.CharField(max_length=50, blank=True, null=True)
    cable_type = models.CharField(max_length=50, blank=True, null=True)
    p_material = models.CharField(max_length=50, blank=True, null=True)
    p_dia_mm = models.CharField(max_length=50, blank=True, null=True)
    phase_c = models.FloatField(blank=True, null=True)
    c_dia_mm = models.IntegerField(blank=True, null=True)
    c_material = models.CharField(max_length=50, blank=True, null=True)
    geom = models.MultiLineStringField(blank=True, null=True)

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
    geom = models.MultiPolygonField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'house'


class ManHole(models.Model):
    gid = models.AutoField(primary_key=True)
    geom = models.PointField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'man hole'


class OutletValve(models.Model):
    gid = models.AutoField(primary_key=True)
    field_gid = models.IntegerField(db_column='__gid', blank=True, null=True)  # Field renamed because it contained more than one '_' in a row. Field renamed because it started with '_'.
    geom = models.PointField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'outlet_valve'


class Park(models.Model):
    gid = models.AutoField(primary_key=True)
    geom = models.MultiPolygonField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'park'


class Road(models.Model):
    gid = models.AutoField(primary_key=True)
    road_type = models.CharField(max_length=50, blank=True, null=True)
    road_typ_1 = models.CharField(max_length=50, blank=True, null=True)
    geom = models.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'road'


class Sanitary(models.Model):
    gid = models.AutoField(primary_key=True)
    type = models.CharField(max_length=30, blank=True, null=True)
    pipe_mat = models.CharField(max_length=50, blank=True, null=True)
    diamr_mm_field = models.IntegerField(db_column='diamr_mm_', blank=True, null=True)  # Field renamed because it ended with '_'.
    trench_dep = models.CharField(max_length=50, blank=True, null=True)
    geom = models.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sanitary'


class SanitaryJunctionPoint(models.Model):
    gid = models.AutoField(primary_key=True)
    junction_p = models.CharField(max_length=50, blank=True, null=True)
    geom = models.PointField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sanitary_junction_point'


class Sewer(models.Model):
    gid = models.AutoField(primary_key=True)
    type = models.CharField(max_length=50, blank=True, null=True)
    pipe_type = models.CharField(max_length=50, blank=True, null=True)
    p_diam_mm_field = models.BigIntegerField(db_column='p_diam_mm_', blank=True, null=True)  # Field renamed because it ended with '_'.
    geom = models.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sewer'


class SewerJunctionPoints(models.Model):
    gid = models.AutoField(primary_key=True)
    man_hole = models.CharField(max_length=50, blank=True, null=True)
    geom = models.PointField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sewer_junction_points'


class Street(models.Model):
    gid = models.AutoField(primary_key=True)
    power_watt = models.IntegerField(blank=True, null=True)
    pol_height = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=50, blank=True, null=True)
    geom = models.PointField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'street'


class Swimmingpool(models.Model):
    gid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, blank=True, null=True)
    geom = models.MultiPolygonField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'swimmingpool'


class TelephoneInternet(models.Model):
    gid = models.AutoField(primary_key=True)
    line_type = models.CharField(max_length=50, blank=True, null=True)
    cabel_type = models.CharField(max_length=50, blank=True, null=True)
    p_material = models.CharField(max_length=50, blank=True, null=True)
    p_dia_mm = models.IntegerField(blank=True, null=True)
    geom = models.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'telephone_internet'


class Temple(models.Model):
    gid = models.AutoField(primary_key=True)
    geom = models.MultiPolygonField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'temple'


class WaterNetwork(models.Model):
    gid = models.AutoField(primary_key=True)
    line_type = models.CharField(max_length=50, blank=True, null=True)
    pip_dia_in = models.FloatField(blank=True, null=True)
    geom = models.MultiLineStringField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'water_network'
