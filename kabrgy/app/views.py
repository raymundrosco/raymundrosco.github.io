from django.http import HttpResponse
from django.shortcuts import render
from .models import Requirement, SK
from .forms import UploadFileForm


def index(request):
    obj = Requirement.objects.all()
    context = {
        "obj" : obj
    }
    return render(request, "index.html", context)

def leaderboards(request):
    obj = SK.objects.all().order_by('-xp').values()
    context = {
        "obj" : obj
    }
    return render(request, "leaderboards.html", context)

def requirement(request):
    obj = Requirement.objects.all()
    
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        file = request.FILES['file']
        return HttpResponse(str(file))
    else:
        form = UploadFileForm()

    context = {
        "obj" : obj,
        "form": form,
    }

    return render(request, "requirement.html", context)

def feedback(request):
    return render(request, "lydo_index.html")