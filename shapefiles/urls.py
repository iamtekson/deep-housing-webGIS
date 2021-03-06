from django.urls import path
from . import views
urlpatterns = [
    path('boundary', views.boundary, name='boundary'),
    path('boundarybuilding', views.boundarybuilding, name='boundarybuilding'),
    path('drainage', views.drainage, name="drainage"),
    path('outletvalve', views.outletValve, name="outletvalve"),
    path('manhole', views.manhole, name='manhole'),
    path('park', views.park, name="park"),
    path('street', views.street, name='street'),
    path('road', views.road, name="road"),
    path('sanitary', views.sanitary, name="sanitary"),
    path('sanitaryjunctionpoint', views.sanitaryJunctionPoint, name='sanitaryjunctionpoint'),
    path('street', views.street, name="street"),
    path('swimmingpool', views.swimmingpool, name="swimmingpool"),
    path('temple', views.temple, name="temple"),
    path('waternetwork', views.waterNetwork, name="waternetwork"),
    path('house', views.house, name="house"),
    path('electrical', views.electrical, name='electrical'),
    path('telephoneinternet', views.telephoneInternet, name='telephoneinternet')
]