from django.urls import path
from django.contrib.auth import views as auth_views
from carpool.passenger_views import Passenger_Index, Listof_Ride, FeedBack_Passenger, Emergency, support_dashboard, \
    PaymentIndex, Paymentdetails, PaymentIndex2, Checkout, Profile, Reject, Approve, Accept_trip, Endtrip, \
    Rate_Review, Request, Approved_Trips, Report_Complaint, My_Passenger, Ride_Later, Later, Later_Trip_View, \
    Checkout_Later, Delete, Feed_Reply

urlpatterns = [
    path('',Passenger_Index.as_view()),
    path('listofride',Listof_Ride.as_view()),
    path('request', Request.as_view()),
    path('approve', Approve.as_view()),
    path('reject', Reject.as_view()),
    path('feedbackpass', FeedBack_Passenger.as_view()),
    path('feed_reply', Feed_Reply.as_view()),
    # path('feedback', Feedback_count.as_view()),
    path('emergency', Emergency.as_view()),
    path('support', support_dashboard),
    path('payment', PaymentIndex.as_view()),
    path('payment2', PaymentIndex2.as_view()),
    path('paymentdetails',Paymentdetails.as_view()),
    path('checkout', Checkout.as_view()),
    path('checkout_later', Checkout_Later.as_view()),
    path('profile', Profile.as_view()),
    path('accepttrip', Accept_trip.as_view()),
    path('endtrip', Endtrip.as_view()),
    path('rate', Rate_Review.as_view()),
    path('report_complaint', Report_Complaint.as_view()),
    # path('complaint', Complaint.as_view()),
    path('approved_trip', Approved_Trips.as_view()),
    path('my_passenger', My_Passenger.as_view()),
    path('later', Later.as_view()),
    path('ride_later', Ride_Later.as_view()),
    path('later_view', Later_Trip_View.as_view()),
    path('delete', Delete.as_view()),
    path('logout/', auth_views.LogoutView.as_view(
        next_page='/'
    ),
         name='logout'
         ),
]

def urls():
    return urlpatterns,'passenger','passenger'