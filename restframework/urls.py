from django.urls import path, include
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register('/houses', views.HouseView)

urlpatterns = [
    path('house', include(router.urls)),
]