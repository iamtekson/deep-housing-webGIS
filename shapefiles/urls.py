from django.urls import path
from . import views
urlpatterns = [
    path('boundary', views.boundary),
    path('boundarybuilding', views.boundarybuilding),
    path('drainage', views.drainage),
    path('drainageoutletvalve', views.drainageOutletValve),
    path('park', views.park),
    path('road', views.road),
    path('sanitary', views.sanitary),
    path('sanitaryjunctionpoint', views.sanitaryJunctionPoint),
    path('sewer', views.sewer),
    path('sewerjunctionpoints', views.sewerJunctionPoints),
    path('street', views.street),
    path('temple', views.temple),
    path('waternetwork', views.waterNetwork),
]