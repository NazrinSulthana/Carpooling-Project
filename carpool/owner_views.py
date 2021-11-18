from django.contrib.auth.models import User
from django.shortcuts import render
from django.views.generic import TemplateView

from carpool.models import OwnerEntry, UserType, Offerride, CarDetails


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
        submit = CarDetails()
        submit.owner = owner
        submit.carname = carname
        submit.seat = seat
        submit.color = color
        submit.carno = carno
        submit.user = user
        submit.save()
        return render(request, 'owner/cardetails.html')

class Routesetting(TemplateView):
    template_name = 'owner/routesetting.html'

    def post(self, request, *args, **kwargs):
        user = UserType.objects.get(user_id=self.request.user.id)
        owner = OwnerEntry.objects.get(user_id=self.request.user.id)
        startlocation = request.POST['startlocation']
        endlocation = request.POST['endlocation']
        date = request.POST['date']
        time = request.POST['time']
        publish = Offerride()
        publish.owner = owner
        publish.startlocation = startlocation
        publish.endlocation = endlocation
        publish.date = date
        publish.time = time
        publish.user = user
        publish.save()
        return render(request, 'owner/routesetting.html')

class FeedBack_Owner(TemplateView):
    template_name = 'owner/owner_feedback.html'

    def post(self, request, *args, **kwargs):
        message = request.POST['feedback']
        print(message)
        owner = OwnerEntry.objects.get(user_id=self.request.user.id)
        user = UserType.objects.get(user_id=self.request.user.id)
        feedback = FeedBack()
        feedback.feedback = message
        feedback.owner = owner
        feedback.user = user
        feedback.status = "not replied"
        feedback.save()
        return render(request,'owner/owner_index.html',{'message':" Feedback sent"})


class Payment(TemplateView):
    template_name = 'owner/payment.html'

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
            owner.gender = request.POST['gender']
            owner.license = request.POST['license']
            owner.image = request.POST['image']
            owner.save()
            return render(request, 'owner/profile.html', {'message': "Profile Updated"})
        else:
            user.username = request.POST['username']
            user.set_password(request.POST['password'])
            user.save()
            return render(request, 'owner/profile.html', {'message': "Updated Username and Password"})
