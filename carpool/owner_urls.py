from django.urls import path
from django.contrib.auth import views as auth_views
from carpool.owner_views import Owner_Index, Routesetting, Car_Details, Payment, FeedBack_Owner, Profile

urlpatterns = [
    path('', Owner_Index.as_view()),
    path('cardetails', Car_Details.as_view()),
    path('routesetting', Routesetting.as_view()),
    path('feedbackto', FeedBack_Owner.as_view()),
    path('payment', Payment.as_view()),
    path('profile', Profile.as_view()),
    path('logout/', auth_views.LogoutView.as_view(
        next_page='/'
    ),
         name='logout'
         ),

]

def urls():
    return urlpatterns,'owner','owner'