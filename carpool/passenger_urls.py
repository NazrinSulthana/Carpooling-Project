from django.urls import path
from django.contrib.auth import views as auth_views
from carpool.passenger_views import Passenger_Index, Listof_Ride, FeedBack_Passenger, Emergency, support_dashboard, \
    PaymentIndex, Paymentdetails, PaymentIndex2, Checkout, Profile

urlpatterns = [
    path('',Passenger_Index.as_view()),
    path('listofride',Listof_Ride.as_view()),
    path('feedbackpass', FeedBack_Passenger.as_view()),
    path('emergency', Emergency.as_view()),
    path('support', support_dashboard),
    path('payment', PaymentIndex.as_view()),
    path('payment2', PaymentIndex2.as_view()),
    path('paymentdetails',Paymentdetails.as_view()),
    path('checkout', Checkout.as_view()),
    path('profile', Profile.as_view()),
    path('logout/', auth_views.LogoutView.as_view(
        next_page='/'
    ),
         name='logout'
         ),
]

def urls():
    return urlpatterns,'passenger','passenger'