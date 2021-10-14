from django.urls import path

from carpool.admin_views import Admin_View

urlpatterns = [
    path('',Admin_View.as_view()),
]

def urls():
    return urlpatterns,'admin','admin'