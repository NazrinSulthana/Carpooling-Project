# from django.conf import settings
# from django.conf.urls import url
# from django.conf.urls.static import static
# from django.contrib.staticfiles.urls import staticfiles_urlpatterns
# from django.urls import path
#
# from carpool import views
# from carpool.views import Owner_Registration, Login, Index_View, Passenger_Registration
#
# urlpatterns = [
#     path('', Index_View.as_view()),
#     path('owner_register', Owner_Registration.as_view()),
#     path('passenger_register',Passenger_Registration.as_view()),
#     path('login',Login.as_view()),
#
# ]
# urlpatterns += staticfiles_urlpatterns()
# urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)