import json

from django.conf import settings
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.contrib.messages.views import SuccessMessageMixin
from django.core.files.storage import FileSystemStorage
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from datetime import datetime, date
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import TemplateView, CreateView

from carpool.mail import request_mail
from carpool.models import UserType, PassengerEntry, SeekRide, Offerride, SupportTicket, Payment, Feedback_Passenger, \
    Rate, OwnerEntry, Report_Issue


class Passenger_Index(TemplateView):
    template_name = 'passenger/passenger_index_publishride.html'


class Listof_Ride(TemplateView):
    template_name = 'passenger/listofride.html'

    def post(self,request,*args,**kwargs):

        passenger = PassengerEntry.objects.get(user_id=self.request.user.id)
        leavingfrom = request.POST['leavingfrom']
        leavingto = request.POST['leavingto']
        try:
            offerride = Offerride.objects.filter(startlocation=leavingfrom, endlocation=leavingto)

            for j in offerride:
                rate = Rate.objects.filter(owner_id=j.owner.id).count()
                rateone = Rate.objects.filter(owner_id=j.owner.id)
                if (rate > 0):
                    rate1 = 0
                    for i in rateone:
                        rate1 = rate1 + int(i.rating)
                    total = rate1 * 5
                    avg = (rate1 / total) * 5




            return render(request, 'passenger/listofride.html',{'message':"check your ride partner",'rides':offerride,'av':avg })
        except:
            return render(request, 'passenger/listofride.html',{'message': "No rides found"})

class Checkout(TemplateView):
    template_name = 'passenger/checkout.html'

    def get_context_data(self, **kwargs):
        # id = self.request.GET['id']
        print(id)
        context = super(Checkout, self).get_context_data(**kwargs)
        # passenger = PassengerEntry.objects.filter(user_id=self.request.user.id)
        amount = Offerride.objects.all()
        # context['passenger'] = passenger
        context['amount'] = amount
        return context

class Checkout_Later(TemplateView):
    template_name = 'passenger/checkout_later.html'

    def get_context_data(self, **kwargs):
        # id = self.request.GET['id']
        print(id)
        context = super(Checkout_Later, self).get_context_data(**kwargs)
        # passenger = PassengerEntry.objects.filter(user_id=self.request.user.id)
        amount = Offerride.objects.all()
        # context['passenger'] = passenger
        context['amount'] = amount
        return context

class Request(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        offer = Offerride.objects.get(id=id)
        # email = request.GET['email']
        # user = User.objects.get(email=email)
        # user.email = email
        offer.status = '2'
        request_mail(offer.owner.user.email)
        offer.save()
        myid=self.request.user.id
        p = PassengerEntry.objects.get(user_id=myid)
        ride = SeekRide()
        ride.passenger_id = p.id
        ride.offerride_id = offer.id
        # seek.id = id

        ride.save()
        return render(request,'passenger/passenger_index_publishride.html',{'message':"Mail send successfully"})

class Approved_Trips(TemplateView):
    template_name = 'passenger/approved_trips.html'

    def get_context_data(self, **kwargs):
        context = super(Approved_Trips, self).get_context_data(**kwargs)
        approvedtrip = Offerride.objects.filter(status=3).all()
        context['approvedtrip'] = approvedtrip
        return context

class My_Passenger(TemplateView):
    template_name = 'passenger/my_passenger.html'

    def get_context_data(self, **kwargs):
        context = super(My_Passenger, self).get_context_data(**kwargs)
        myfriends = SeekRide.objects.filter(offerride__status=3)
        context['myfriends'] = myfriends
        return context



class Approve(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        offer = Offerride.objects.get(pk=id)
        offer.status='1'
        offer.seatno=offer.seatno-1
        offer.save()
        return render(request,'passenger/checkout.html')


class Reject(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        offer = Offerride.objects.filter(id=id).delete()
        return redirect('/passenger')

class Later(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        offer = Offerride.objects.get(pk=id)
        offer.later='1'
        offer.save()
        return render(request,'/')

class Ride_Later(TemplateView):
    template_name = 'passenger/ride_later.html'

    def get_context_data(self, **kwargs):
        context = super(Ride_Later, self).get_context_data(**kwargs)
        offer = Offerride.objects.filter(later=1)
        print('offer')
        context['offer'] = offer
        return context

class Later_Trip_View(TemplateView):
    template_name = 'passenger/later_trip_view.html'

    def get_context_data(self, **kwargs):
        context = super(Later_Trip_View, self).get_context_data(**kwargs)
        id = self.request.user.id
        ridedetails = Offerride.objects.filter(later=1)
        context['ridedetail'] = ridedetails
        return context

class Delete(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET.get('id')
        print(id)
        today = datetime.date.today()
        b = SeekRide.objects.get(pk=id)
        date = b.date
        fd_obj = datetime.datetime.strptime(date, '%Y-%m-%d')
        # fd_obj_minus = fd_obj - datetime.tismedelta(days=3)
        minus = fd_obj.date()
        if today < minus:
            total = b.total
            per = (int(float(total))/10)*3
            gt = int(float(total))-int(per)
            b.status = 'Cancel'
            b.total = gt
            b.save()
            dict = {'name': 'true'}
            sorted_string = json.dumps(dict)
            print("true")
            return JsonResponse(sorted_string, safe=False)
        else:
            dict = {'name':'false'}
            sorted_string = json.dumps(dict)
            print("false")
            return JsonResponse(sorted_string, safe=False)

# class Delete(View):
#     def dispatch(self, request, *args, **kwargs):
#         id = request.GET['id']
#         # car = CarDetails.objects.get(pk=id)
#         car = SeekRide.objects.filter(id=id).delete()
#         # car.status = 'delete'
#         # car.save()
#         return redirect('/')

class FeedBack_Passenger(TemplateView):
    template_name = 'passenger/passenger_feedback.html'

    def get_context_data(self, **kwargs):
        context = super(FeedBack_Passenger, self).get_context_data(**kwargs)
        owner = OwnerEntry.objects.all()
        context['owner'] = owner
        return context

    def post(self, request, *args, **kwargs):
        ownername = request.POST['ownername']
        message = request.POST['feedback']
        print(message)
        passenger = PassengerEntry.objects.get(user_id=self.request.user.id)
        user = UserType.objects.get(user_id=self.request.user.id)
        feedback = Feedback_Passenger()
        feedback.ownername = ownername
        feedback.feedback = message
        feedback.passenger = passenger
        feedback.user = user
        feedback.status = "not replied"
        feedback.save()
        return render(request, 'passenger/passenger_feedback.html', {'message': " Feedback sent"})

class Feed_Reply(TemplateView):
    template_name = 'passenger/feed_reply.html'

    def get_context_data(self, **kwargs):
        context = super(Feed_Reply, self).get_context_data(**kwargs)
        id = self.request.user.id
        feed = Feedback_Passenger.objects.filter(passenger__user=id)
        context['feed'] = feed
        return context


class Emergency(TemplateView):
    template_name = 'passenger/emergency.html'

class SupportTicketCreate(SuccessMessageMixin, CreateView):
    """Renders the home page and the support ticket form"""

    model = SupportTicket
    fields = ['name', 'phone_number', 'description']
    template_name = 'index.html'
    success_url = reverse_lazy('home')
    success_message = "Your ticket was submitted! An agent will call you soon."


def support_dashboard(request):
    """Shows the list of support tickets to a support agent"""
    context = {}

    context['support_tickets'] = SupportTicket.objects.order_by('-timestamp')

    return render(request, 'browser_calls/support_dashboard.html', context)


def get_token(request):
    identity = 'support_agent' if 'dashboard' in request.GET['forPage'] else 'customer'

    # Create access token with credentials
    access_token = AccessToken(settings.TWILIO_ACCOUNT_SID, settings.API_KEY, settings.API_SECRET, identity=identity)

    # Create a Voice grant and add to token
    voice_grant = VoiceGrant(
        outgoing_application_sid=settings.TWIML_APPLICATION_SID,
        incoming_allow=True, # Optional: add to allow incoming calls
    )
    access_token.add_grant(voice_grant)

    token = access_token.to_jwt()

    return JsonResponse({'token': token.decode('utf-8')})

@csrf_exempt
def call(request):
    """Returns TwiML instructions to Twilio's POST requests"""
    response = VoiceResponse()
    dial = response.dial(caller_id=settings.TWILIO_NUMBER)

    # If the browser sent a phoneNumber param, we know this request
    # is a support agent trying to call a customer's phone
    if 'phoneNumber' in request.POST:
        dial.number(request.POST['phoneNumber'])
    else:
        # Otherwise we assume this request is a customer trying
        # to contact support from the home page
        dial.client('support_agent')

    return HttpResponse(
        str(response), content_type='application/xml; charset=utf-8'
    )

class PaymentIndex(TemplateView):
    template_name = 'passenger/payment.html'
    def post(self,request,*args,**kwargs):
        amount = request.POST['amount']
        id = self.request.POST['id']
        user = User.objects.get(id=id)
        details = PassengerEntry.objects.get(user_id=id)
        if amount != 0:
            payment = Payment()
            payment.amount = amount
            payment.user = user
            payment.details = details
            payment.save()
            return render(request,'passenger/payment_index.html')

class PaymentIndex2(TemplateView):
    template_name = 'passenger/payment_index.html'
    def get_context_data(self, **kwargs):
        context = super(PaymentIndex2, self).get_context_data(**kwargs)
        amounts = Payment.objects.filter(passenger_id=self.request.user.id)
        context['amounts'] = amounts
        return context

class Paymentdetails(TemplateView):
    template_name = 'passenger/payment_details.html'


class Profile(TemplateView):
    template_name = 'passenger/profile.html'

    def get_context_data(self, **kwargs):
        context = super(Profile, self).get_context_data(**kwargs)
        context['user'] = self.request.user
        if self.request.user.is_active:
            passenger = PassengerEntry.objects.get(user_id=self.request.user.id)
            context['passenger'] = passenger
        return context
    def post(self,request,*args,**kwargs):
        user = User.objects.get(id=self.request.user.id)
        passenger = PassengerEntry.objects.get(user_id=self.request.user.id)
        if request.POST['profile'] == "profile":
            passenger.contact = request.POST['contact']
            passenger.dob = request.POST['dob']
            # passenger.gender = request.POST['gender']
            passenger.adhar = request.FILES['adhar']
            passenger.image = request.FILES['image']
            passenger.save()
            return render(request, 'passenger/profile.html', {'message': "Profile Updated"})
        else:
            user.username = request.POST['username']
            user.set_password(request.POST['password'])
            user.save()
            return render(request, 'passenger/profile.html', {'message': "Updated Username and Password"})

class Accept_trip(TemplateView):
    template_name = 'passenger/accept_trip.html'

class Endtrip(TemplateView):
    template_name = 'passenger/endtrip.html'

class Rate_Review(TemplateView):
    template_name = 'passenger/rate.html'
    def get_context_data(self, **kwargs):
        context = super(Rate_Review, self).get_context_data(**kwargs)
        seek = SeekRide.objects.filter(passenger__user=self.request.user.id,offerride__status='1')
        context['seek'] = seek
        return context

    def post(self,request,*args,**kwargs):
        rating = request.POST['rating']
        review = request.POST['review']
        status = request.POST['status']
        owner = request.POST['owner']
        passenger = PassengerEntry.objects.get(user_id=self.request.user.id)
        owner = OwnerEntry.objects.get(pk=owner)
        rate = Rate()
        rate.rating = rating
        rate.review = review
        rate.status = status
        rate.passenger_id = passenger.id
        rate.owner = owner
        rate.save()
        return render(request, 'passenger/passenger_index_publishride.html',{'message':"completed"})

class Report_Complaint(TemplateView):
    template_name = 'passenger/report_complaint.html'
    def get_context_data(self, **kwargs):
        context = super(Report_Complaint, self).get_context_data(**kwargs)
        owner = OwnerEntry.objects.all()
        print(owner)
        passenger = PassengerEntry.objects.filter(user_id=self.request.user.id)
        print(passenger)
        context['owner'] = owner
        context['passenger'] = passenger
        return context




