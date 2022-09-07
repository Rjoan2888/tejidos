from django.db import models
from django.utils.translation import gettext_lazy as _
from usuarios.models import  Usuario, Rol

class Talla(models.Model):
    class Tipo_talla(models.TextChoices):
        Numero='Numero', _('Numero')
        Letra='Letra', _('Letra')
    tipo_talla= models.CharField(max_length=8, choices=Tipo_talla.choices, verbose_name="Tipo talla")
    nombre=models.CharField(max_length=10, verbose_name="nombre")
    class Estado(models.TextChoices):
        ACTIVO='Activo', _('Activo')
        INACTIVO='Inactivo', _('Inactivo')
        ANULADO='Anulado', _('Anulado')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ACTIVO)
    def __str__(self) -> str:
        return "%s"% (self.nombre)
    def clean(self):
        self.Tipo_talla= self.nombre.capitalize()

class Marca(models.Model):
    nombre=models.CharField(max_length=20, verbose_name="Nombre")
    class Estado(models.TextChoices):
        ACTIVO='Activo', _('Activo')
        INACTIVO='Inactivo', _('Inactivo')
        ANULADO='Anulado', _('Anulado')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ACTIVO)
    def __str__(self) -> str:
        return '%s' % (self.nombre)
    def clean(self):
        self.nombre= self.nombre.capitalize()

class Color(models.Model):
    nombre=models.CharField(max_length=20, verbose_name="Nombre")
    class Estado(models.TextChoices):
        ACTIVO='Activo', _('Activo')
        INACTIVO='Inactivo', _('Inactivo')
        ANULADO='Anulado', _('Anulado')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ACTIVO)
    def __str__(self) -> str:
        return '%s' % (self.nombre)
    def clean(self):
        self.nombre= self.nombre.capitalize()


class Producto(models.Model):
    rol=models.ForeignKey(Rol, on_delete=models.SET_NULL, null=True,verbose_name="Proveedor/Asociada")
    usuario=models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True,verbose_name="Proveedor/Asociada")
    
    class Categoria(models.TextChoices):
        TEJIDOS='Tejidos',_('Tejidos')
        ROPA='Ropa',_('Ropa')   
        CALZADO='Calzado',_('Calzado')  
    categoria=models.CharField(max_length=10, choices=Categoria.choices, verbose_name="Categoría")
    nombre=models.CharField(max_length=50, verbose_name="Nombre del producto ")
    stock=models.IntegerField(verbose_name="Cantidad")
    precio= models.IntegerField(verbose_name="Precio")
    precio_venta= models.IntegerField(default=0,verbose_name="Precio venta")
    porcentaje= models.IntegerField(max_length=1, verbose_name="Porcentaje")
    valorPorcentaje=models.FloatField(null=True,verbose_name="Valor Porcentaje ")
    class Estado(models.TextChoices):
        ACTIVO='Activo', _('Activo')
        INACTIVO='Inactivo', _('Inactivo')
        ANULADO='Anulado', _('Anulado')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ACTIVO)
    talla= models.ForeignKey(Talla, on_delete=models.SET_NULL, null=True, verbose_name=u"Talla")
    marca= models.ForeignKey(Marca, on_delete=models.SET_NULL, null=True, verbose_name=u"Marca")
    color= models.ForeignKey(Color, on_delete=models.SET_NULL, null=True, verbose_name=u"Color")
    def __str__(self)-> str:
        return '%s / %s / %s / %s' % (self.nombre,self.marca,self.talla,self.color)
    def clean(self):
        self.nombre= self.nombre.title()


    


# https://developer.mozilla.org/es/docs/Learn/Server-side/Django/Authentication
       

