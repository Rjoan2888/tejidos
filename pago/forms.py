
from django import forms
from pago.models import Pago, Detalle_pago

class PagoForm(forms.ModelForm):
    class Meta: 
        model = Pago
        fields = []
        
class Detalle_pagoForm(forms.ModelForm):
    class Meta: 
        model =  Detalle_pago
        fields = []
            