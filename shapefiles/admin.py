from django.contrib import admin
from leaflet.admin import LeafletGeoAdmin
from .models import Sewer

class sewerAdmin(LeafletGeoAdmin):
    list_display = ('gid', 'type')
    
admin.site.register(Sewer, sewerAdmin)
