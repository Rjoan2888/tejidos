from multiprocessing import context
from django.shortcuts import render, redirect
from usuarios.forms import    UsuarioForm
from usuarios.models import  Usuario, Rol
from django.contrib import messages 
from django.contrib.auth.decorators import login_required

@login_required(login_url="usuario-login")

def cusuario(request):
    """En esta funcion primero se hereda los roles, para asi cargar el formulario de Usuario en el HTML  y ya finalizado
    se guardara en la base de datos y se redirecciona al mismo formulario """

    titulo_pagina="usuario"
    usuario_db = Usuario.objects.all()
    rol_c= Rol.objects.all()

    if request.method == 'POST':
        form = UsuarioForm(request.POST)   
        if form.is_valid():
            form.save()
            usuario_Unombre= form.cleaned_data.get('Unombre')
            messages.success(request,f'Usuario {usuario_Unombre} se agregó correctamente')
            return redirect('usuario-crearUsuario')
    else:
        form = UsuarioForm()
    context={
        "titulo_pagina": titulo_pagina,
        "usuario_db": usuario_db,
        "form":form,
        "rol":rol_c
    }
    return render(request,'usuario/crearUsuario.html', context)



@login_required(login_url="usuario-login")
def tusuario(request):
    """En esta funcion primero se trae la informacion de la bases de datos de los roles y usuarios, despues se crean automaticamente los tres roles.
    Y por ultimo se imprime en la tabla del HTML"""

    titulo_pagina="Usuario"
    tusuarios= Usuario.objects.all()
    existe=Rol.objects.all()

    if len(existe) == 0:
        Rol.objects.create(
            Rnombre="Asociada"                                                                                                                                                                                                                                                                                                                    
            )
    if len(existe) == 1:
        Rol.objects.create(
            Rnombre="Cliente"
            )
    if len(existe) == 2:
        Rol.objects.create(
            Rnombre="Proveedor"
            )
    context={
        "tusuarios": tusuarios,
        "titulo_pagina":titulo_pagina
    }
    return render(request, "usuario/tablaUsuario.html",context)

@login_required(login_url="usuario-login")
def vusuario (request,pk):
    """En esta funcion se carga la informacion del usuario por la id, y se imprime sus datos en una tabla
    """

    titulo_pagina="Producto"
    usuario= Usuario.objects.get(Uid=pk) 
    print(usuario)
    context={
        "usuario": usuario,
        "titulo_pagina":titulo_pagina
    }
    return render(request,"usuario/verusuario.html", context)

@login_required(login_url="usuario-login")
def Editarusuario(request,pk):
    """En esta funcion se carga el formulario con los datos que ya llenos, se podra editar estos campos y guardar
    """
    titulo_pagina="Producto"
    tusuarios= Usuario.objects.get(Uid=pk)
    if request.method == 'POST':
        form= UsuarioForm(request.POST, instance=tusuarios)
        if form.is_valid():
            form.save()
        return redirect('usuario-tablaUsuario')
    else:
        form= UsuarioForm(instance=tusuarios)
        
        context={
        "tusuarios": tusuarios,
        "titulo_pagina": titulo_pagina,
    }
    return render(request, "usuario/editarusuario.html", ({'base_datos':tusuarios,'form':form,  "titulo_pagina":titulo_pagina}))

@login_required(login_url="usuario-login")
def usuario_eliminar(request,pk):
    """En esta funcion se edita el estado del usuario a inactivo
    """
    titulo_pagina='Usuarios'
    tusuarios= Usuario.objects.all()
    tusuario= Usuario.objects.get(Uid=pk)
    accion_txt= f"el usuario {tusuario.Uid}"
    if request.method == 'POST':
        form = UsuarioForm(request.POST)
        Usuario.objects.filter(Uid=pk).update(
                    estado='Inactivo',
                )
        tusuario_nombre=  tusuario.Unombre
        messages.success(request,f'Usuario {tusuario_nombre} se desactivò correctamente')
        return redirect('usuario-tablaUsuario')
                                   
    else:
        form:UsuarioForm()
    context={
            "titulo_pagina": titulo_pagina,
            "accion_txt":accion_txt,
            "tusuarios": tusuarios,
           
    }
    return render(request, "usuario/usuario-eliminar.html", context)

    
                                                                                                                                                                                                                                                                                              