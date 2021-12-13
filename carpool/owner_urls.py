from django.urls import path
from django.contrib.auth import views as auth_views
from carpool.owner_views import Owner_Index, Routesetting, Car_Details, Payment, FeedBack_Owner, Profile, Mycars, \
    DeleteCar, Myrides, Myrating, Ride_requests, Approve_Ride, Reject_Ride, Completed_Rides, Feedback_Reply

urlpatterns = [
    path('', Owner_Index.as_view()),
    path('cardetails', Car_Details.as_view()),
    path('routesetting', Routesetting.as_view()),
    path('feedbackto', FeedBack_Owner.as_view()),
    path('comp_reply', Feedback_Reply.as_view()),
    path('payment', Payment.as_view()),
    path('profile', Profile.as_view()),
    path('mycars', Mycars.as_view()),
    path('delete', DeleteCar.as_view()),
    path('myrides', Myrides.as_view()),
    path('comp_rides', Completed_Rides.as_view()),
    path('myrating', Myrating.as_view()),
    path('riderequest', Ride_requests.as_view()),
    path('approve_ride', Approve_Ride.as_view()),
    path('reject_ride', Reject_Ride.as_view()),
    path('logout/', auth_views.LogoutView.as_view(
        next_page='/'
    ),
         name='logout'
         ),

]

def urls():
    return urlpatterns,'owner','owner'