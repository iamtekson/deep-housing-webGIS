from django.shortcuts import render
from django.core.serializers import serialize
from django.http import HttpResponse
from .models import Boundary, Boundarybuilding, Drainage, DrainageOutletValve, Park, Road, Sanitary, SanitaryJunctionPoint, Sewer, SewerJunctionPoints, Street, Swimmingpool, Temple, WaterNetwork

def boundary(request):
    boundaryData = serialize('geojson', Boundary.objects.all())
    return HttpResponse(boundaryData, content_type='geojson')

