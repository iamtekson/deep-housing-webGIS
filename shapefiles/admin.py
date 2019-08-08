from django.contrib import admin
from leaflet.admin import LeafletGeoAdmin
from .models import Boundary, Boundarybuilding, Drainage, DrainageOutletValve, Park, Road, Sanitary, SanitaryJunctionPoint, Sewer, SewerJunctionPoints, Street, Swimmingpool, Temple, WaterNetwork

class BoundaryAdmin(LeafletGeoAdmin):
    list_display = ('gid', 'area')
    
admin.site.register(Boundary, BoundaryAdmin)
admin.site.register(Boundarybuilding, LeafletGeoAdmin)
admin.site.register(Drainage, LeafletGeoAdmin)
admin.site.register(DrainageOutletValve, LeafletGeoAdmin)
admin.site.register(Park, LeafletGeoAdmin)
admin.site.register(Road,LeafletGeoAdmin)
admin.site.register(Sanitary, LeafletGeoAdmin)
admin.site.register(SanitaryJunctionPoint, LeafletGeoAdmin)
admin.site.register(Sewer, LeafletGeoAdmin)
admin.site.register(SewerJunctionPoints, LeafletGeoAdmin)
admin.site.register(Street, LeafletGeoAdmin)
admin.site.register(Swimmingpool, LeafletGeoAdmin)
admin.site.register(Temple, LeafletGeoAdmin)
admin.site.register(WaterNetwork, LeafletGeoAdmin)