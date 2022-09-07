from tkinter import Widget
from django import forms
from facturas.models import Factura, Detalle

class FacturaForm(forms.ModelForm):
    class Meta: 
        model = Factura
        fields = []
        
class DetalleForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(DetalleForm, self).__init__(*args, **kwargs)
        self.fields['cantidad_detalle'].widget.attrs['min'] = 1
        
    def clean_price(self):
        price = self.cleaned_data['price']
        if price < 1:
            raise forms.ValidationError("Price cannot be less than 0.01")
        return price

    class Meta: 
        model = Detalle
        fields = ['cantidad_detalle']
        
