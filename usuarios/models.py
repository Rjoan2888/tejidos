import unicodedata
from django.db import models
from django.utils.translation import gettext_lazy as _

# Create your models here.
class Rol(models.Model):
    Rid=models.AutoField(primary_key=True)
    Rnombre=models.CharField(max_length=12)
    class Meta:
        db_table="usuarios_rol"
    def __str__(self) -> str:
        return "%s "% (self.Rnombre)
    
    
class Usuario(models.Model):
    
    Uid=models.AutoField(primary_key=True)
    rol=models.ForeignKey(Rol, on_delete=models.SET_NULL, null=True,verbose_name="Rol")
    Unombre=models.CharField(max_length=50, verbose_name="Nombre")
    apellido=models.CharField(max_length=50, verbose_name="Apellido")
    documento= models.IntegerField(verbose_name="documento")
    celular=models.CharField(unique=True,max_length=13)
    class Tipo_documento(models.TextChoices):
        Cedula_ciudadania='C.C', _('C.C')
        Tarjeta_identidad='T.I', _('T.I')
        Cedula_extranjeria='C.E', _('C.E')
    tipo_documento= models.CharField(max_length=3, choices=Tipo_documento.choices, verbose_name="Tipo documento")  
    class Estado(models.TextChoices):
        ACTIVO='Activo', _('Activo')
        INACTIVO='Inactivo', _('Inactivo')
        ANULADO='Anulado', _('Anulado')
    estado= models.CharField(max_length=10, choices=Estado.choices, verbose_name="Estado", default=Estado.ACTIVO) 
    class Meta:
        db_table="usuarios_usuario"
    def __str__(self) -> str:
        return "%s"%(self.Unombre)
    def clean(self):
        self.nombre= self.Unombre.title()
    
