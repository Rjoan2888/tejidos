from django.shortcuts import render
import imp
from math import prod
from re import I
from django.shortcuts import render, redirect
from facturas.models import Factura, Detalle,Producto
from facturas.forms import FacturaForm, DetalleForm
from django.contrib import messages
from facturas.views import detalle, factura
from usuarios.models import Rol, Usuario
from productos.models import Producto
from datetime import date,timedelta,datetime
from pago.models import Pago, Detalle_pago
from pago.forms import PagoForm, Detalle_pagoForm
from django.db.models import Max, Sum
from django.db import models

def pago(request):
    rol= Rol.objects.get(Rnombre="Asociada")
    usuario_c=Usuario.objects.filter(rol=rol, estado="Activo")
    
    if request.method == 'POST':
        if Pago.objects.filter(usuario=request.POST['usuario'],estado="Abierta"):
            form = FacturaForm()
            print("Existe un pago abierto para este usuario")
            return redirect('pago-tpago')
        else:
            form = PagoForm(request.POST)
            if form.is_valid():
                usuario= Usuario.objects.get(Uid=request.POST['usuario']),
                
                aux= Pago.objects.create(
                    usuario= usuario[0],
                )
                messages.success(request,f'La factura se agregó correctamente') 
                return redirect('pago-detalles',aux.id)
    else:
        form = FacturaForm()
    context={
        'form':form, 
       
        "usuario":usuario_c
    }
    return render(request,'pago/crear_pago.html', context)

def tpago(request):
    titulo_pagina="Pago"

    tpagos= Pago.objects.all()
    context={
        "tpagos": tpagos,
        "titulo_pagina": titulo_pagina
    }
    return render(request, "pago/pago.html",context)



def vpago (request,pk):
    titulo_pagina="Pago"
    pago= Pago.objects.get(id=pk)
    detalles_1= Detalle_pago.objects.filter(pago_id=pk)
    context={
        "pago": pago,
        "titulo_pagina":titulo_pagina,
        "detalles_1":detalles_1
    }
    return render(request,"pago/ver_pago.html", context)

# Create your views here.

def pago_detalle(request,pk):# pk es el id del pago
    titulo_pagina="Pagos"
    
    pago_u=Pago.objects.get(id=pk)
    productos= Producto.objects.filter(usuario=pago_u.usuario)
    asoc= Usuario.objects.get(Uid=pago_u.usuario.Uid)
    ultimo_pago=Pago.objects.filter(usuario=asoc).order_by("-fecha")[0].fecha
    

    if(Detalle_pago.objects.filter(pago_id=pago_u.id).values("pago").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))):
            total= Detalle_pago.objects.filter(pago_id=pago_u.id).values("pago").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))[0]["total_definitivo"]
            Pago.objects.filter(id=pk).update(
                neto_pagar=total                
        )
    else:
        total=0
            
    ventas= Detalle.objects.filter(producto__usuario = asoc,factura__estado="Cerrada",factura__tipofactura="Venta",estado="Abierta")#factura__fecha__gte=ultimo_pago
    if not Detalle_pago.objects.filter(pago=pago_u):
        for item in ventas:
            pago_detalle=Detalle_pago.objects.create(
                detalle= item,
                pago= pago_u,
                valor= item.producto.precio,
                total= item.producto.precio *item.cantidad_detalle
            )
        if(Detalle_pago.objects.filter(pago_id=pago_u.id).values("pago").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))):
            total= Detalle_pago.objects.filter(pago_id=pago_u.id).values("pago").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))[0]["total_definitivo"]
            Pago.objects.filter(id=pk).update(
                neto_pagar=total                
        )
        else:
            total=0   
        
    else:
        pass
        
    detalles_p= Detalle_pago.objects.filter(pago_id=pk)
   
    context={
        "ventas":ventas,
        "productos":productos,
        "titulo_pagina": titulo_pagina,
        "detalles_p": detalles_p,                                   
        "total":total,
        "pago":pago_u,
    }
    return render(request, "pago/detalle-pago.html", context)

def pago_estado(request,pk, estado):
    titulo_pagina='Factura'
    
    tpagos= Pago.objects.all()
    tpago= Pago.objects.get(id=pk)
    eliminacion= Detalle_pago.objects.filter(pago=tpago)
    veridetalle= Detalle_pago.objects.filter(pago=tpago)
    
    estado_msj=""
    estado_txt=""
    if estado == "Pagar":
        estado_txt= "Pagar"
        estado_msj= f"efectuar el pago {tpago.id}?, una vez pagado no hay marcha atrás."
        if request.method == 'POST':
            Pago.objects.filter(id=pk).update(
                        estado='Pagada'
                        
                    )
           
            print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>",det)
            tfactura_usuario=  tpago.usuario
            messages.success(request,f'pago {tpago.id} se efectuo correctamente')
            return redirect('pago-tpago')
        else:
            form=FacturaForm()
    else:
        if veridetalle.exists():
            estado_txt= "Cerrar"
            estado_msj= f"efectuar el pago {tpago.id}?, una vez pagado no hay marcha atrás."
            if request.method == 'POST':
                pag=Pago.objects.filter(id=pk).update(
                            estado='Cerrada'
                        )
                det= Detalle_pago.objects.filter(pago=pk)
                print(det)
                for item in det:
                    Detalle.objects.filter(id=item.detalle.id).update(
                        estado="Cerrada"
                    )        
                
                tfactura_usuario=  tpago.usuario
                messages.success(request,f'pago {tpago.id} se guardo correctamente')
                return redirect('pago-tpago')
            else:
                form:PagoForm()
        else:
            Pago.objects.filter(id=pk).delete(  
                    )
            messages.warning(request,f'el pago se borró ya que no habian ventas de ese usuario')
            return redirect('pago-tpago')        
    context={
            "titulo_pagina": titulo_pagina,
            "estado_msj":estado_msj,
            "estado_txt":estado_txt,
            "tpagos": tpagos,
           
    }
    return render(request, "pago/pago-estado.html", context)

def detalle_estado(request,pk,cantidad ):
    titulo_pagina='producto'
    u_detalles= Detalle_pago.objects.get(id=pk)
    pago_u= u_detalles.pago
    detalles= Detalle_pago.objects.filter(pago_id=pago_u.id)
    accion_txt= f"Eliminando detalle {u_detalles.id} "
   
    if request.method == 'POST':
        form= Detalle_pagoForm(request.POST)
        Producto.objects.filter(id=u_detalles.producto_id).update(
            stock=Producto.objects.get(id=u_detalles.producto_id).stock - int(cantidad),
        )
        u_detalles.delete()
        messages.success(request,f'El detalle de factura se eliminó correctamente ')
        return redirect('pago-detalles',pago_u.id),
    else:   
        form=DetalleForm()
    context={
            "titulo_pagina": titulo_pagina,
            "accion_txt":accion_txt,
            "detalles": detalles,
            "pago_u":pago_u,
            "form":form,
        
            
    }
    return render(request, "factura/detalle-eliminar.html", context) 