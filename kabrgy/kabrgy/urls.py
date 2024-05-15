from app import views

from django.contrib import admin
from django.urls import path
 
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls, name="admin"),
    path('', views.index, name='index'),
    path('leaderboards/', views.leaderboards, name='leaderboards'),
    path('requirements/', views.requirement, name='requirements'),
    path('feedback/', views.feedback, name='feedback')
]

urlpatterns += static(settings.MEDIA_ROOT, document_root=settings.MEDIA_ROOT)