from django.contrib.auth.models import User
from django.core.files.storage import FileSystemStorage
from django.http import request
from django.shortcuts import render, redirect
from django.views import View
from django.views.generic import TemplateView

from carpool.mail import approve_mail, reject_mail
from carpool.models import OwnerEntry, UserType, Offerride, CarDetails, Feedback_Owner, Rate, SeekRide


class Owner_Index(TemplateView):
    template_name = 'owner/owner_index.html'

class Car_Details(TemplateView):
    template_name = 'owner/cardetails.html'

    def post(self, request, *args, **kwargs):
        user = UserType.objects.get(user_id=self.request.user.id)
        owner = OwnerEntry.objects.get(user_id=self.request.user.id)
        carname = request.POST['carname']
        seat = request.POST['seat']
        color = request.POST['color']
        carno = request.POST['carno']
        image = request.FILES['image']
        file = FileSystemStorage()
        image = file.save(image.name, image)
        submit = CarDetails()
        submit.owner = owner
        submit.carname = carname
        submit.seat = seat
        submit.color = color
        submit.carno = carno
        submit.image = image
        submit.user = user
        submit.save()
        return render(request, 'owner/cardetails.html',{'message':"New Car Added"})

class Routesetting(TemplateView):
    template_name = 'owner/routesetting.html'

    def get_context_data(self, **kwargs):
        context = super(Routesetting, self).get_context_data(**kwargs)
        id = self.request.user.id
        cardetails = CarDetails.objects.filter(owner__user=id)
        context['cardetail'] = cardetails
        return context

    def post(self, request, *args, **kwargs):
        user = UserType.objects.get(user_id=self.request.user.id)
        owner = OwnerEntry.objects.get(user_id=self.request.user.id)
        startlocation = request.POST['startlocation']
        endlocation = request.POST['endlocation']
        carnames = request.POST.get('carnames')
        seatno = request.POST.get('seatno')
        date = request.POST['date']
        time = request.POST['time']
        amount = request.POST['amount']
        laggage = request.POST['laggage']
        smoking = request.POST['smoking']
        pets = request.POST['pets']
        music = request.POST['music']
        publish = Offerride()
        publish.owner = owner
        publish.startlocation = startlocation
        publish.endlocation = endlocation
        publish.carnames = carnames
        publish.seatno = seatno
        publish.date = date
        publish.time = time
        publish.amount = amount
        publish.laggage = laggage
        publish.smoking = smoking
        publish.pets = pets
        publish.music = music
        publish.owner = owner
        publish.user = user
        publish.save()
        return render(request, 'owner/routesetting.html', {'message':" New Trip Added"})


class FeedBack_Owner(TemplateView):
    template_name = 'owner/owner_feedback.html'

    def post(self, request, *args, **kwargs):
        message = request.POST['feedback']
        print(message)
        owner = OwnerEntry.objects.get(user_id=self.request.user.id)
        user = UserType.objects.get(user_id=self.request.user.id)
        feedback = Feedback_Owner()
        feedback.feedback = message
        feedback.owner = owner
        feedback.user = user
        feedback.status = "not replied"
        feedback.save()
        return render(request,'owner/owner_index.html',{'message':" Feedback sent"})

class Feedback_Reply(TemplateView):
    template_name = 'owner/feedback_reply.html'

    def get_context_data(self, **kwargs):
        context = super(Feedback_Reply, self).get_context_data(**kwargs)
        id = self.request.user.id
        feedback = Feedback_Owner.objects.filter(owner__user=id)
        context['feedback'] = feedback
        return context


class Payment(TemplateView):
    template_name = 'owner/payment.html'
    def get_context_data(self, **kwargs):
        context = super(Payment, self).get_context_data(**kwargs)
        amount = Offerride.objects.all()
        context['amount'] = amount
        return context


class Profile(TemplateView):
    template_name = 'owner/profile.html'

    def get_context_data(self, **kwargs):
        context = super(Profile, self).get_context_data(**kwargs)
        context['user'] = self.request.user
        if self.request.user.is_active:
            owner = OwnerEntry.objects.get(user_id=self.request.user.id)
            context['owner'] = owner
        return context
    def post(self,request,*args,**kwargs):
        user = User.objects.get(id=self.request.user.id)
        owner = OwnerEntry.objects.get(user_id=self.request.user.id)
        if request.POST['profile'] == "profile":
            owner.contact = request.POST['contact']
            owner.dob = request.POST['dob']
            # owner.gender = request.POST['gender']
            owner.license = request.FILES['license']
            owner.image = request.FILES['image']
            owner.save()
            return render(request, 'owner/profile.html', {'message': "Profile Updated"})
        else:
            user.username = request.POST['username']
            user.set_password(request.POST['password'])
            user.save()
            return render(request, 'owner/profile.html', {'message': "Updated Username and Password"})

class Mycars(TemplateView):
    template_name = 'owner/mycars.html'

    def get_context_data(self, **kwargs):
        context = super(Mycars, self).get_context_data(**kwargs)
        id=self.request.user.id
        cardetails = CarDetails.objects.filter(owner__user=id)
        print(cardetails)
        context['cardetail'] = cardetails
        return context


class DeleteCar(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        # car = CarDetails.objects.get(pk=id)
        car = CarDetails.objects.filter(id=id).delete()
        # car.status = 'delete'
        # car.save()
        return redirect('mycars')

class Completed_Rides(TemplateView):
    template_name = 'owner/completed_rides.html'

    def get_context_data(self, **kwargs):
        context = super(Completed_Rides, self).get_context_data(**kwargs)
        id = self.request.user.id
        ridedetails = Offerride.objects.filter(status=1,owner__user=id)
        context['ridedetail'] = ridedetails
        return context

class Myrides(TemplateView):
    template_name = 'owner/myrides.html'

    def get_context_data(self, **kwargs):
        context = super(Myrides, self).get_context_data(**kwargs)
        id = self.request.user.id
        ridedetails = Offerride.objects.filter(status=0,owner__user=id)
        context['ridedetail'] = ridedetails
        return context


class Ride_requests(TemplateView):
    template_name = 'owner/ride_request.html'

    def get_context_data(self, **kwargs):
        context = super(Ride_requests, self).get_context_data(**kwargs)
        # riderequest = Offerride.objects.filter(status=2)
        seek = SeekRide.objects.filter(offerride__status=2)
        # context['riderequest'] = riderequest
        # print(riderequest)
        context['seek'] = seek
        print(seek)
        return context

class Approve_Ride(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        offer = SeekRide.objects.get(id=id)
        offer.offerride.status = '3'
        # print(offer.offerride__status)
        offerr = Offerride.objects.get(id=offer.offerride.id)
        offerr.status = '3'
        approve_mail(offer.passenger.user.email)
        offer.save()
        offerr.save()
        return render(request,'owner/ride_request.html', {'message':"Ride Approved"})

class Reject_Ride(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        offer = SeekRide.objects.get(id=id).delete()
        print(offer)
        # reject_mail(offer.passenger.user.email)
        return redirect('/owner',{'message':"Ride Cancelled"})

class Myrating(TemplateView):
    template_name = 'owner/myrating.html'

    def get_context_data(self, **kwargs):
        context = super(Myrating, self).get_context_data(**kwargs)
        reviews = Rate.objects.all()
        context['review'] = reviews
        return context
