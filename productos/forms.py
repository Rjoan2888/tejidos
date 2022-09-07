from dataclasses import fields
from django import forms

from productos.models import  Color, Talla, Marca, Color, Producto


class TallaForm(forms.ModelForm):
    class Meta:
        model = Talla
        fields= ['tipo_talla', 'nombre']

class MarcaForm(forms.ModelForm):
    class Meta:
        model = Marca
        fields= ['nombre']

class ColorForm(forms.ModelForm):
    class Meta:
        model = Color
        fields= ['nombre']
        
class ProductoForm(forms.ModelForm):
    
    def __init__(self, *args, **kwargs):
        super(ProductoForm, self).__init__(*args, **kwargs)
        self.fields['precio'].widget.attrs['min'] = 1
        self.fields['stock'].widget.attrs['min'] = 1
        


    class Meta:
        model= Producto
        fields= ['categoria', 'nombre','precio', 'stock','porcentaje','color','talla','marca'] 
        
