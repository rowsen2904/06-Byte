from django.urls import path

from . import views

urlpatterns = [
    path('sos/', views.SosList.as_view())
]
