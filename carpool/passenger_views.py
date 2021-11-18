from django.conf import settings
from django.contrib.auth.models import User
from django.contrib.messages.views import SuccessMessageMixin
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import TemplateView, CreateView

from carpool.models import UserType, PassengerEntry, SeekRide, Offerride, SupportTicket, Payment


class Passenger_Index(TemplateView):
    template_name = 'passenger/passenger_index_publishride.html'

    def post(self, request, *args, **kwargs):
        user = UserType.objects.get(user_id=self.request.user.id)
        passenger = PassengerEntry.objects.get(user_id=self.request.user.id)
        leavingfrom = request.POST['leavingfrom']
        leavingto = request.POST['leavingto']
        seek = SeekRide()
        seek.passenger = passenger
        seek.leavingfrom = leavingfrom
        seek.leavingto = leavingto
        seek.user = user
        seek.save()
        return render(request, 'passenger/passenger_index_publishride.html')

class Listof_Ride(TemplateView):
    template_name = 'passenger/listofride.html'

    def post(self, request, *args, **kwargs):
        user = UserType.objects.get(user_id=self.request.user.id)
        passenger = PassengerEntry.objects.get(user_id=self.request.user.id)
        list = Offerride()


class FeedBack_Passenger(TemplateView):
    template_name = 'passenger/passenger_feedback.html'

    def post(self, request, *args, **kwargs):
        message = request.POST['feedback']
        passenger = PassengerEntry.objects.get(user_id=self.request.user.id)
        user = UserType.objects.get(user_id=self.request.user.id)
        feedback = FeedBack()
        feedback.feedback = message
        feedback.passenger = passenger
        feedback.user = user
        feedback.status = "not replied"
        feedback.save()
        return render(request,'passenger/passenger_feedback.html',{'message':" Feedback sent"})



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

class Checkout(TemplateView):
    template_name = 'passenger/checkout.html'


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
            passenger.gender = request.POST['gender']
            passenger.adhar = request.POST['adhar']
            passenger.image = request.POST['image']
            passenger.save()
            return render(request, 'passenger/profile.html', {'message': "Profile Updated"})
        else:
            user.username = request.POST['username']
            user.set_password(request.POST['password'])
            user.save()
            return render(request, 'passenger/profile.html', {'message': "Updated Username and Password"})

