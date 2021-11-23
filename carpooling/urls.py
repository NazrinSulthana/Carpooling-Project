"""carpooling URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.urls import path, include

from carpool import views, owner_urls, admin_urls, passenger_urls
from carpool.views import Index_View, Owner_Registration, Passenger_Registration, LoginView, Forgotpassword
from carpooling import settings

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('', Index_View.as_view()),
    path('owner_reg',Owner_Registration.as_view()),
    path('passenger_register',Passenger_Registration.as_view()),
    path('login',LoginView.as_view()),
    path('forgot', Forgotpassword.as_view()),
    path('owner/', owner_urls.urls()),
    path('passenger/', passenger_urls.urls()),
    path('admin/', admin_urls.urls()),
]
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)