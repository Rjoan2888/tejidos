import imp
from math import prod
from re import I
from django.shortcuts import render, redirect
from facturas.models import Factura, Detalle,Producto
from facturas.forms import FacturaForm, DetalleForm
from django.contrib import messages
from usuarios.models import Rol, Usuario
from productos.models import Producto
from datetime import datetime
from django.db.models import Sum
from django.db import models
from django.contrib.auth.decorators import login_required

@login_required(login_url="usuario-login")
def factura(request):
    rol_c=Rol.objects.all()
    usuario_c=Usuario.objects.all()
    
    facturadb = Factura.objects.all()
    if request.method == 'POST':
        
        form = FacturaForm(request.POST)
        if form.is_valid():
            usuario= Usuario.objects.get(Uid=request.POST['usuario']),
            
            aux= Factura.objects.create(
                rol_id= request.POST['rol'],
                usuario= usuario[0],
            )
            if(usuario[0].rol.Rnombre == 'Cliente' ):
                tipo='Venta'
            else:
                tipo='Compra'
            
            
            Factura.objects.filter(id=aux.id).update(  
                tipofactura=tipo
            )
            messages.success(request,f'La factura se agregó correctamente') 
            return redirect('factura-detalle',aux.id)
    else:
        form = FacturaForm()
    context={
        'base_datos':facturadb,
        'form':form, 
        "rol":rol_c,
        "usuario":usuario_c
    }
    return render(request,'factura/crearFactura.html', context)

@login_required(login_url="usuario-login")
def tfactura(request):
    titulo_pagina="Factura"

    
    tfacturas= Factura.objects.all()
    context={
        "tfacturas": tfacturas,
        "titulo_pagina": titulo_pagina
    }
    return render(request, "factura/factura.html",context)

@login_required(login_url="usuario-login")
def vfactura (request,pk):
    titulo_pagina="Factura"
    factura= Factura.objects.get(id=pk)
    detalles= Detalle.objects.filter(factura_id=pk)
    print(detalles)
    context={
        "factura": factura,
        "titulo_pagina":titulo_pagina,
        "detalles":detalles
    }
    return render(request,"factura/verfactura.html", context)


@login_required(login_url="usuario-login")
def factura_eliminar(request,pk):
    titulo_pagina='Facturas'
    tfacturas= Factura.objects.all()
    tfactura= Factura.objects.get(id=pk)
    accion_txt= f" la factura {tfactura.id}"
    if request.method == 'POST':
        form = FacturaForm(request.POST)
        Factura.objects.filter(id=pk).update(
                    decision='Inactivo'
                )
        tfactura_usuario=  tfactura.usuario
        messages.success(request,f'Factura {tfactura.id} anulada correctamente')
        return redirect('factura-tfactura')
                
    else:
        form:FacturaForm()
    context={
            "titulo_pagina": titulo_pagina,
            "accion_txt":accion_txt,
            "tfacturas": tfacturas,
            
    }
    return render(request, "factura/factura-eliminar.html", context)


@login_required(login_url="usuario-login")
def detalle(request,pk):#pk es el id de la factura
    titulo_pagina="facturas"
    detalles= Detalle.objects.filter(factura_id=pk)
    factura_u=Factura.objects.get(id=pk)
    
    
    #Suma los precios y da un total
    if(Detalle.objects.filter(factura_id=factura_u.id).values("factura").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))):
        total= Detalle.objects.filter(factura_id=factura_u.id).values("factura").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))[0]["total_definitivo"]
    else:
        total=0
    #Filtrando productos para visualizacion del cliente
    if factura_u.rol.Rnombre == 'Cliente':
        productos= Producto.objects.filter(estado="Activo")
    else:
        productos= Producto.objects.filter(usuario=factura_u.usuario)
    
    if request.method == 'POST':
        form= DetalleForm(request.POST)
        if form.is_valid():    
            producto= Producto.objects.get(id=request.POST['producto'])
            if factura_u.tipofactura =="Compra":
                existe= Detalle.objects.filter(factura=pk,producto=producto)
                if len(existe) == 0:
                    Detalle.objects.create(
                            cantidad_detalle= form.cleaned_data.get('cantidad_detalle'),
                            total= producto.precio *  form.cleaned_data.get('cantidad_detalle'),                                                          
                            factura=factura_u,               
                            producto = producto,
                            precioX= producto.precio
                    )
                    
                    
                    Producto.objects.filter(id=producto.id).update(
                        stock=producto.stock + form.cleaned_data.get('cantidad_detalle')
                    
                    )

                    if(Detalle.objects.filter(factura_id=factura_u.id).values("factura").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))):
                        total= Detalle.objects.filter(factura_id=factura_u.id).values("factura").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))[0]["total_definitivo"]
                        Factura.objects.filter(id=pk).update(
                            neto_pagar=total                
                        )
                    else:
                        total=0
                    

                    
                    messages.success(request,f' se agregó {producto} a la factura correctamente')
                    return redirect('factura-detalle', pk=pk)
                else:
                    anterior=Detalle.objects.filter(factura_id=pk,producto=request.POST['producto'])
                    
                    Detalle.objects.filter(factura_id=pk,producto=request.POST['producto']).update(
                        cantidad_detalle=anterior[0].cantidad_detalle + form.cleaned_data.get('cantidad_detalle'),
                        total=anterior[0].total + producto.precio * form.cleaned_data.get('cantidad_detalle'),
                    )
                    
                    Producto.objects.filter(id=producto.id).update(
                            stock=producto.stock + form.cleaned_data.get('cantidad_detalle')
                        
                        )
                    if(Detalle.objects.filter(factura_id=factura_u.id).values("factura").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))):
                        total= Detalle.objects.filter(factura_id=factura_u.id).values("factura").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))[0]["total_definitivo"]
                        Factura.objects.filter(id=pk).update(
                            neto_pagar=total                
                    )
                    else:
                        total=0
                    
                    Factura.objects.filter(id=pk).update(
                            neto_pagar=total                
                    )

            else:
                if(producto.stock >= int(request.POST['cantidad_detalle'])):
                    existe= Detalle.objects.filter(factura_id=factura_u.id,producto=producto)
                    cantidadA= Usuario.objects.filter(rol=1)
                    print(cantidadA)
                    if len(existe) == 0: 
                        
                        factura= Detalle.objects.create(
                                cantidad_detalle= form.cleaned_data.get('cantidad_detalle'),
                                total= producto.precio_venta *  form.cleaned_data.get('cantidad_detalle'),                                                          
                                factura=factura_u,               
                                producto = producto,
                                precioX= producto.precio_venta 
                        )
                        
                        
                        
                        Producto.objects.filter(id=producto.id).update(
                            stock=producto.stock - form.cleaned_data.get('cantidad_detalle')
                        
                        )
                        
                        if(Detalle.objects.filter(factura_id=factura_u.id).values("factura").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))):
                            total= Detalle.objects.filter(factura_id=factura_u.id).values("factura").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))[0]["total_definitivo"]
                            Factura.objects.filter(id=pk).update(
                            neto_pagar=total                
                        )
                        else:
                            total=0
                        
                        messages.success(request,f' se agregó {producto} a la factura correctamente')
                        return redirect('factura-detalle', pk=pk)
                    else:
                        anterior=Detalle.objects.filter(factura_id=factura_u.id,producto=request.POST['producto'])
                        
                        anterior.update(
                            
                            cantidad_detalle=anterior[0].cantidad_detalle + form.cleaned_data.get('cantidad_detalle'),
                            total=anterior[0].total + producto.precio * form.cleaned_data.get('cantidad_detalle'),
                        )
                        Producto.objects.filter(id=producto.id).update(
                            stock=producto.stock - form.cleaned_data.get('cantidad_detalle')
                        )
                        if(Detalle.objects.filter(factura_id=factura_u.id).values("factura").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))):
                            total= Detalle.objects.filter(factura_id=factura_u.id).values("factura").annotate(total_definitivo=Sum(('total'),output_field=models.IntegerField()))[0]["total_definitivo"]
                            Factura.objects.filter(id=pk).update(
                            neto_pagar=total                
                        )
                        else:
                            total=0
                else:
                    messages.warning (request,f' Solo hay stock de {producto.stock} {producto.nombre}/s')
        else:
            messages.warning (request,f' Error')
    else:
        form= DetalleForm() 
    context={
        "productos":productos,
        "titulo_pagina": titulo_pagina,
        "detalles": detalles,                                   
        "form":form,
        "factura":factura_u,
        "total":total
    }
    return render(request, "factura/detalle-factura.html", context)

@login_required(login_url="usuario-login")
def detalle_estado(request,pk,cantidad ):
    titulo_pagina='producto'
    u_detalles= Detalle.objects.get(id=pk)
    factura_u= u_detalles.factura
    detalles= Detalle.objects.filter(factura_id=factura_u.id)
    accion_txt= f"el detalle {u_detalles.id} "
   
    if request.method == 'POST':
        if (factura_u.tipofactura =="Venta"):
            form= DetalleForm(request.POST)
            Producto.objects.filter(id=u_detalles.producto_id).update(
                stock=Producto.objects.get(id=u_detalles.producto_id).stock + int(cantidad),
            )
            Factura.objects.filter(id=factura_u.id).update(
                        neto_pagar=0
                        
            )
            u_detalles.delete()
            messages.success(request,f'El detalle de factura se elimino correctamente ')
            return redirect('factura-detalle',factura_u.id)
        else:
            form= DetalleForm(request.POST)
            Producto.objects.filter(id=u_detalles.producto_id).update(
                stock=Producto.objects.get(id=u_detalles.producto_id).stock - int(cantidad),
            )
            Factura.objects.filter(id=factura_u.id).update(
                        neto_pagar=0          
            )
            u_detalles.delete()
            messages.success(request,f'El detalle de factura se elimino correctamente ')
            return redirect('factura-detalle',factura_u.id)
        
    else:
        
        form=DetalleForm()
    context={
            "titulo_pagina": titulo_pagina,
            "accion_txt":accion_txt,
            "detalles": detalles,
            "factura":factura_u,
            "form":form,
        
            
    }
    return render(request, "factura/detalle-eliminar.html", context) 

@login_required(login_url="usuario-login")
def factura_estado(request,pk, estado):
    titulo_pagina='Factura'
    
    tfacturas= Factura.objects.all()
    tfactura= Factura.objects.get(id=pk)
    eliminacion= Detalle.objects.filter(factura=tfactura)
    veridetalle= Detalle.objects.filter(factura=tfactura)
    
    estado_msj=""
    estado_txt=""
    if estado == "Abierta":
        if not eliminacion.exists():
            estado_txt= "Eliminar"
            estado_msj= f"factura {tfactura.id}"
            if request.method == 'POST':
                form = FacturaForm(request.POST)
                
                tfactura.delete()
                messages.success(request,f'Factura {pk} se elimino correctamente')
                return redirect('factura-tfactura')
            else:
                form=FacturaForm()
        else:
            messages.warning(request,f'la factura {pk} no se puede eliminar, tiene productos registrados')
            return redirect('factura-tfactura')
    elif estado == "Cerrada":
        estado_txt= "Anular"
        estado_msj= f"factura {tfactura.id}, una vez anulada no se podrá restablecer."
        if request.method == 'POST':
            form = FacturaForm(request.POST)
            Factura.objects.filter(id=pk).update(
                        estado='Anulada'
                    )
            tfactura_usuario=  tfactura.usuario
            messages.success(request,f'Factura {tfactura.id} anulada correctamente')
            return redirect('factura-tfactura')
        else:
            form=FacturaForm()
    else:
        if veridetalle.exists():
            estado_txt= "Cerrar"
            estado_msj= f"{estado_txt} la factura {tfactura.id}, una vez cerrada no se podrán agregar nuevos productos"
            if request.method == 'POST':
                form = FacturaForm(request.POST)
                Factura.objects.filter(id=pk).update(
                            estado='Cerrada'
                        )
                tfactura_usuario=  tfactura.usuario
                messages.success(request,f'factura {tfactura.id} cerrada correctamente')
                return redirect('factura-tfactura')
            else:
                form:FacturaForm()
        else:
            messages.warning(request,f'la factura {pk} no se puede cerrar, dado a que esta vacia')
            return redirect('factura-detalle', pk)        
    context={
            "titulo_pagina": titulo_pagina,
            "estado_msj":estado_msj,
            "estado_txt":estado_txt,
            "tfacturas": tfacturas,
           
    }
    return render(request, "factura/factura-estado.html", context)

@login_required(login_url="usuario-login")
def factura_anular(request,pk):
    titulo_pagina='Factura'
    tfacturas= Factura.objects.all()
    tfactura= Factura.objects.get(id=pk)
    accion_txt= f"factura {tfactura.id}, una vez anulada no se restablecerán cambíos."
    if request.method == 'POST':
        form = FacturaForm(request.POST)
        Factura.objects.filter(id=pk).update(
                    estado='Anulada'
                )
        tfactura_usuario=  tfactura.usuario
        messages.success(request,f'factura {tfactura.id} anulada correctamente')
        return redirect('factura-tfactura')
                                   
    else:
        form:FacturaForm()
    context={
            "titulo_pagina": titulo_pagina,
            "accion_txt":accion_txt,
            "tfacturas": tfacturas,
           
    }
    return render(request, "factura/factura-eliminar.html", context)



# Create your views here.
