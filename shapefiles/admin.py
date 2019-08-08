from django.contrib import admin
from leaflet.admin import LeafletGeoAdmin
from .models import Boundary, Boundarybuilding, Drainage, DrainageOutletValve, Park, Road, Sanitary, SanitaryJunctionPoint, Sewer, SewerJunctionPoints, Street, Swimmingpool, Temple, WaterNetwork

class BoundaryAdmin(LeafletGeoAdmin):
    list_display = ('gid', 'area')
    
admin.site.register(Boundary, BoundaryAdmin)
