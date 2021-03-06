from django.shortcuts import render
from django.core.serializers import serialize
from django.http import HttpResponse
from .models import Boundary, Boundarybuilding, Drainage, OutletValve, ManHole, Park, Road, Sanitary, SanitaryJunctionPoint, Street, Swimmingpool, Temple, WaterNetwork, House, Electrical, TelephoneInternet

def boundary(request):
    boundaryData = serialize('geojson', Boundary.objects.all())
    return HttpResponse(boundaryData, content_type='geojson')

def boundarybuilding(request):
    boundarybuildingData = serialize('geojson', Boundarybuilding.objects.all())
    return HttpResponse(boundarybuildingData, content_type='geojson')

def drainage(request):
    drainageData = serialize('geojson', Drainage.objects.all())
    return HttpResponse(drainageData, content_type='geojson')

def outletValve(request):
    outletValveData = serialize('geojson', OutletValve.objects.all())
    return HttpResponse(outletValveData, content_type='geojson')

def manhole(request):
    manholeData = serialize('geojson', ManHole.objects.all())
    return HttpResponse(manholeData, content_type='geojson')

def park(request):
    parkData = serialize('geojson', Park.objects.all())
    return HttpResponse(parkData, content_type='geojson')

def road(request):
    roadData = serialize('geojson', Road.objects.all())
    return HttpResponse(roadData, content_type='geojson')

def sanitary(request):
    sanitaryData = serialize('geojson', Sanitary.objects.all())
    return HttpResponse(sanitaryData, content_type='geojson')

def sanitaryJunctionPoint(request):
    sanitaryJunctionPointData = serialize('geojson', SanitaryJunctionPoint.objects.all())
    return HttpResponse(sanitaryJunctionPointData, content_type='geojson')

def street(request):
    streetData = serialize('geojson', Street.objects.all())
    return HttpResponse(streetData, content_type='geojson')

def swimmingpool(request):
    swimmingpoolData = serialize('geojson', Swimmingpool.objects.all())
    return HttpResponse(swimmingpoolData, content_type='geojson')

def temple(request):
    templeData = serialize('geojson', Temple.objects.all())
    return HttpResponse(templeData, content_type='geojson')

def waterNetwork(request):
    waterNetworkData = serialize('geojson', WaterNetwork.objects.all())
    return HttpResponse(waterNetworkData, content_type='geojson')

def house(request):
    houseData = serialize('geojson', House.objects.all())
    return HttpResponse(houseData, content_type='geojson')

def electrical(request):
    electricalData = serialize('geojson', Electrical.objects.all())
    return HttpResponse(electricalData, content_type='geojson')

def telephoneInternet(request):
    telephoneInternetData = serialize('geojson', TelephoneInternet.objects.all())
    return HttpResponse(telephoneInternetData, content_type='geojson')