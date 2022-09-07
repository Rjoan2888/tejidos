from django.urls import path
from pago.views import pago,tpago,pago_detalle,pago_estado, vpago,detalle_estado
from django.contrib.auth import views as auth_views


urlpatterns = [
    path('crearpago/', pago, name='pago-pago'),
    path('pago/', tpago, name='pago-tpago'),
    path('pago/<int:pk>/', pago_detalle, name='pago-detalles'),
    path('detalle-pago/estado/<int:pk>/<str:estado>/', pago_estado, name='pago_estado'),
    path('ver_pago/<int:pk>', vpago, name='pago-verpago'),
    path('detalle-pago/eliminar/<int:pk>/<str:cantidad>', detalle_estado, name='detalle_eliminar'),    
]

 