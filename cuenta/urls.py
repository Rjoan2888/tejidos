from django.urls import path
from cuenta.views import registrar, termicondicion

urlpatterns = [
    path('registrar/', registrar ,name='registrar'),
    path('terminosyc/', termicondicion ,name='cuenta-terminosy')
]
