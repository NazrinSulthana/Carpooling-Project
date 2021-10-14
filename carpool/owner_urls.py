from django.urls import path

from carpool.owner_views import Owner_Index

urlpatterns = [
    path('', Owner_Index.as_view()),

]

def urls():
    return urlpatterns,'owner','owner'