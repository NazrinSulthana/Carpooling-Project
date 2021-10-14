from django.urls import path

from carpool.passenger_views import Passenger_Index

urlpatterns = [
    path('',Passenger_Index.as_view()),
]

def urls():
    return urlpatterns,'passenger','passenger'