from rest_framework import serializers
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from shapefiles.models import House

class HouseSerializer(GeoFeatureModelSerializer):
    class Meta:
        model = House
        fields = ('gid', 'house_type', 'area_sq_m_field', 'curr_resid', 'permanent', 'plot_no')
        geo_field = 'geom'