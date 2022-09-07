from django.shortcuts import render, redirect
from .forms import UserRegisterForm
from django.contrib import messages
from django.contrib.auth.models import User


def registrar(request):
	existe=User.objects.all()
	if request.method == 'POST':
		if len(existe) == 0:
			form = UserRegisterForm(request.POST)	
			if form.is_valid() :	
				form.save()
				username = form.cleaned_data['username']
				messages.success(request, f'Usuario {username} creado correctamente')
				return redirect('index')
			else:
				messages.warning(request,'Error solo se puede crear una cuenta')
		else:
			messages.success(request,'Error')
			return redirect('index')
	else:
		form = UserRegisterForm()
	context = { 'form' : form,
	}	
	return render(request, 'user/registrar.html', context)
	
def termicondicion(request):
		return render(request, 'user/terminos.html')














