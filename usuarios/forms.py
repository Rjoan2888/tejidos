from django import forms
from usuarios.models import  Usuario




class UsuarioForm(forms.ModelForm):
    
    def __init__(self, *args, **kwargs):
        super(UsuarioForm, self).__init__(*args, **kwargs)
        self.fields['documento'].widget.attrs['min'] = 1
        
    def clean_price(self):
        price = self.cleaned_data['price']
        if price < 1:
            raise forms.ValidationError("Price cannot be less than 0.01")
        return price

    class Meta:
        model = Usuario
        fields = ['rol', 'Unombre','apellido','tipo_documento','documento','celular']
        