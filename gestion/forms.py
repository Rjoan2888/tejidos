from django import forms
from django.forms import ModelForm
from gestion.models import Backup


class UploadFileForm(forms.Form):
    title = forms.CharField(max_length=50)
    file = forms.FileField()

class BackupForm(ModelForm):
    class Meta:
        model= Backup
        fields= ['nombre','archivo']
