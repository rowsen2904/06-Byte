from django.urls import path

from . import views

urlpatterns = [
    path('event/list/', views.EventList.as_view()),
    path('event/type/list/', views.EventTypeList.as_view()),
]
