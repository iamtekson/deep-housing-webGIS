from django.shortcuts import render
from django.core.serilizers import serilizers
from django.http import HttpResponse
from .models import Boundary, Boundarybuilding, Drainage, DrainageOutletValve, Park, Road, Sanitary, SanitaryJunctionPoint, Sewer, SewerJunctionPoints, Street, Swimmingpool, Temple, WaterNetwork

def boundary():
    boundaryData = serilizers('geojson', Boundary.object.all())
    return HttpResponse(boundaryData, content_type='geojson')

