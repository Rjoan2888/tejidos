
from django.urls import path
from productos.views import color_eliminar, marca_eliminar, talla, marca, color, productoT, producto, Verproducto, Editarproducto, Editartalla, Editarmarca, talla_eliminar,Editarcolor, producto_eliminar

urlpatterns = [
    path('talla/', talla, name='producto-talla'),
    path('marca/', marca, name='producto-marca'),
    path('crearcolor/', color, name='producto-color'),
     path('editarcolor/<int:pk>', Editarcolor, name='producto-editarcolor'),
    path('', productoT, name='producto-producto'),
    path('crearproducto/', producto, name='producto-crearproducto'),
    path('verproducto/<int:pk>', Verproducto, name='producto-verproducto'),
    path('editarproducto/<int:pk>', Editarproducto, name='producto-editarproducto'),
    path('editartalla/<int:pk>', Editartalla, name='producto-editartalla'),
    path('editarmarca/<int:pk>', Editarmarca, name='producto-editarmarca'),
    path('creartalla/eliminar/<int:pk>/', talla_eliminar, name='producto-talla-eliminar'),
    path('color/eliminar/<int:pk>/', color_eliminar, name='producto-color-eliminar'),
    path('crearmarca/eliminar/<int:pk>/', marca_eliminar, name='producto-marca-eliminar'),
    path('eliminar/<int:pk>/', producto_eliminar, name='producto-producto-eliminar'),
]