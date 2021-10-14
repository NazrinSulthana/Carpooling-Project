import messages as messages
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from django.views.generic import TemplateView

from carpool.models import UserType, OwnerEntry, PassengerEntry


class Index_View(TemplateView):
    template_name = 'index.html'


class LoginView(TemplateView):
    template_name = 'login.html'
    def post(self, request, *args, **kwargs):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username,password=password)
        # det = User.objects.get(id=1)
        # det.last_name=1
        # det.save()

        if user is not None:

            login(request,user)
            if user.last_name == '1':

                if user.is_superuser:
                    return redirect('/admin')
                elif UserType.objects.get(user_id=user.id).type == "owner":
                    return redirect('/owner')
                else:
                    return redirect('/passenger')
            else:
                return render(request,'login.html',{'message':" User Account Not Authenticated"})
        else:

            return render(request,'index.html',{'message':"Invalid Username or Password"})



class Owner_Registration(TemplateView):
    template_name = 'owner/owner_registration.html'

    def post(self, request, *args, **kwargs):
        fullname = request.POST['name']
        username = request.POST['username']
        dob = request.POST['dob']
        gender = request.POST['gender']
        email = request.POST['email']
        contact = request.POST['contact']
        password = request.POST['password']
        image = request.FILES['image']
        fi = FileSystemStorage()
        files = fi.save(image.name, image)
        license = request.FILES['license']
        fi = FileSystemStorage()
        files = fi.save(image.name, license)
        try:
            user = User.objects.create_user(username=username, password=password, email=email, first_name=fullname,
                                             is_staff='0', last_name='1')
            user.save()
            Owner_Registration = OwnerEntry()
            Owner_Registration.user = user
            Owner_Registration.dob = dob
            Owner_Registration.gender = gender
            Owner_Registration.contact = contact
            Owner_Registration.image = files
            Owner_Registration.license = files
            Owner_Registration.save()
            usertype = UserType()
            usertype.user = user
            usertype.type = "owner"
            usertype.save()
            return redirect('/')
        except:
            messages = "Enter Another Username"
            return render(request, 'index.html', {'messages': messages})

class Passenger_Registration(TemplateView):
    template_name = 'passenger/passenger_registration.html'

    def post(self, request, *args, **kwargs):
        fullname = request.POST['name']
        username = request.POST['username']
        dob = request.POST['dob']
        gender = request.POST['gender']
        email = request.POST['email']
        contact = request.POST['contact']
        password = request.POST['password']
        adhar = request.FILES['adhar']
        fi = FileSystemStorage()
        adhar = fi.save(adhar.name, adhar)
        image = request.FILES['image']
        fil = FileSystemStorage()
        files = fil.save(image.name, image)

        try:
            user = User.objects.create_user(username=username, password=password, first_name=fullname, email=email,
                                            last_name='1')
            user.save()
            reg = PassengerEntry()
            reg.user = user
            reg.gender = gender
            reg.contact = contact
            reg.dob = dob
            reg.adhar = adhar
            reg.image = files
            reg.save()
            usertype = UserType()
            usertype.user = user
            usertype.type = "passenger"
            usertype.save()
            return redirect('/')
        except:
            messages = "Register Successfully"
            return render(request, 'index.html', {'messages': messages})

