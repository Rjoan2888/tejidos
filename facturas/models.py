from xml.etree.ElementInclude import default_loader
from django.db import models
from django.utils.translation import gettext_lazy as _
from usuarios.models import  Usuario,Rol
from productos.models import Producto

class Factura(models.Model):
    fecha=models.DateField(auto_now = True, verbose_name="Fecha de factura", help_text=u"MM/DD/AAAA")
    rol=models.ForeignKey(Rol, on_delete=models.SET_NULL, null=True,verbose_name="Rol")
    usuario=models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True,verbose_name="Nombre")
    tipofactura= models.CharField(max_length=10, verbose_name="Tipo de factura")
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
    class Meta:
        db_table="facturas_factura"
        


class Detalle(models.Model):
    factura=models.ForeignKey(Factura, on_delete=models.SET_NULL, null=True,verbose_name="Factura")
    producto=models.ForeignKey(Producto, on_delete=models.SET_NULL, null=True,verbose_name="Producto")
    class Estado(models.TextChoices):
        ABIERTA='Abierta', _('Abierta')
        CERRADA='Cerrada', _('Cerrada')
        ANULADa='Anulada', _('Anulada')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ABIERTA)
    cantidad_detalle=models.IntegerField(default=0) 
    total=models.IntegerField(default=0)
    precioX=models.IntegerField(default=0)
   
    def __str__(self)-> str:
        return '%s' % (self.id)
    

