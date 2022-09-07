from itertools import product
from django.db import models
from django.db import models
from django.utils.translation import gettext_lazy as _
from usuarios.models import  Usuario,Rol
from productos.models import Producto
from facturas.models import Detalle
# Create your models here.

class Pago(models.Model):
    fecha=models.DateField(auto_now = True, verbose_name="Fecha de factura", help_text=u"MM/DD/AAAA")
    usuario=models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True,verbose_name="Nombre")
    neto_pagar=models.IntegerField(default=0)
    class Estado(models.TextChoices):
        ABIERTA='Abierta', _('Abierta')
        CERRADA='Cerrada', _('Cerrada')
        ANULADa='Anulada', _('Anulada')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ABIERTA)
    class Decision(models.TextChoices):
        ACTIVO= 'Activo', _('Activo')
        INACTIVO= 'Inactivo', _('Inactivo')
    decision= models.CharField(max_length=10, choices=Decision.choices, verbose_name="Estado", default=Decision.ACTIVO)

class Detalle_pago(models.Model):
    pago=models.ForeignKey(Pago, on_delete=models.SET_NULL, null=True,verbose_name="Pago")
    detalle=models.ForeignKey(Detalle, on_delete=models.SET_NULL, null=True,verbose_name="detalle")
   
    class Estado(models.TextChoices):
        ABIERTA='Abierta', _('Abierta')
        CERRADA='Cerrada', _('Cerrada')
        ANULADa='Anulada', _('Anulada')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ABIERTA)
   
    
    valor=models.IntegerField(null=True,blank=True)
    total=models.IntegerField(null=True,blank=True)

    def __str__(self)-> str:
        return '%s' % (self.id)

