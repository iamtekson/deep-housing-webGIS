from rest_framework import serializers
# from rest_framework_gis.serializers import GeoFeatureModelSerializer, GeometrySerializerModelField
from shapefiles.models import House

class HouseSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = House
        fields = ('gid', 'house_type', 'area_sq_m_field', 'curr_resid', 'permanent', 'plot_no', 'geom')
        geo_field = 'geom'