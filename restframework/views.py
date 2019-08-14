from django.shortcuts import render
from rest_framework import viewsets
from shapefiles.models import House
from .serializers import HouseSerializer

class HouseView(viewsets.ModelViewSet):
    queryset = House.objects.all()
    serializer_class = HouseSerializer
