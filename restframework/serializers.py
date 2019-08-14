from rest_framework import serializers
from shapefiles.models import House

class HouseSerializer(serializers.ModelSerializer):
    class Meta:
        model = House
        fields = ('gid', 'house_type', 'area_sq_m_field', 'curr_resid', 'permanent', 'plot_no', 'geom')