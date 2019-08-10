from django.contrib import admin
from django.contrib.auth.models import Group
from leaflet.admin import LeafletGeoAdmin
from .models import Boundary, Boundarybuilding, Drainage, OutletValve, ManHole, Park, Road, Sanitary, SanitaryJunctionPoint, Street, Swimmingpool, Temple, WaterNetwork, House, Electrical, TelephoneInternet

admin.site.unregister(Group)
admin.site.site_header = 'Utility Management System'



class BoundaryAdmin(LeafletGeoAdmin):
    list_display = ('gid', 'area')

class SanitaryAdmin(LeafletGeoAdmin):
    list_display = ('gid', 'type', 'pipe_mat', 'trench_dep')
    list_display_links = ('gid', 'type', 'pipe_mat')

    
admin.site.register(Boundary, BoundaryAdmin)
admin.site.register(Boundarybuilding, LeafletGeoAdmin)
admin.site.register(Drainage, LeafletGeoAdmin)
admin.site.register(OutletValve, LeafletGeoAdmin)
admin.site.register(ManHole, LeafletGeoAdmin)
admin.site.register(Park, LeafletGeoAdmin)
admin.site.register(Road,LeafletGeoAdmin)
admin.site.register(Sanitary, SanitaryAdmin)
admin.site.register(SanitaryJunctionPoint, LeafletGeoAdmin)
admin.site.register(Street, LeafletGeoAdmin)
admin.site.register(Swimmingpool, LeafletGeoAdmin)
admin.site.register(Temple, LeafletGeoAdmin)
admin.site.register(WaterNetwork, LeafletGeoAdmin)
admin.site.register(Electrical, LeafletGeoAdmin)
admin.site.register(House, LeafletGeoAdmin)
admin.site.register(TelephoneInternet, LeafletGeoAdmin)

