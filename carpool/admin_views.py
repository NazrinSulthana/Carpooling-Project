from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.views import View
from django.db.models import Q
from django.views.generic import TemplateView

from carpool.mail import approve_mail, reject_mail
from carpool.models import OwnerEntry, PassengerEntry, Comments, SeekRide, Feedback_Owner, Feedback_Passenger, \
    Offerride, Payment


class Admin_View(TemplateView):
    template_name = 'admin/admin_index.html'

class Owner_View(TemplateView):
    template_name = 'admin/owner_view.html'

    def get_context_data(self, **kwargs):
        context = super(Owner_View,self).get_context_data(**kwargs)
        new_owner = OwnerEntry.objects.filter(user__last_name='1',user__is_staff='0',user__is_active='1')
        context['new_owner'] = new_owner
        return context

class RejectView(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        user = User.objects.get(pk=id)
        reject_mail(user.email)
        user.last_name='1'
        user.is_active='0'
        user.save()
        return render(request,'admin/admin_index.html',{'message':"Account Removed"})

class ApproveView(View):
    def dispatch(self, request, *args, **kwargs):

        id = request.GET['id']
        print(id)
        # email = request.GET['email']
        # print(email)
        user = User.objects.get(pk=id)
        approve_mail(user.email)
        # user.email = email
        user.last_name='1'
        user.save()
        return render(request,'admin/admin_index.html',{'message':" Account Approved"})

class Owner_Approve(TemplateView):
    template_name = 'admin/owner_approve.html'

    def get_context_data(self, **kwargs):
        context = super(Owner_Approve,self).get_context_data(**kwargs)

        new_owner = OwnerEntry.objects.filter(user__last_name='0',user__is_staff='0',user__is_active='1')

        context['new_owner'] = new_owner
        return context

class Owner_Details(TemplateView):
    template_name = 'admin/owner_details.html'

    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        user = OwnerEntry.objects.filter(user_id=id)
        return render(request,'admin/owner_details.html',{'owner_info':user})

class Passenger_View(TemplateView):
    template_name = 'admin/passenger_view.html'

    def get_context_data(self, **kwargs):
        context = super(Passenger_View,self).get_context_data(**kwargs)
        passenger = PassengerEntry.objects.filter(user__last_name='1',user__is_staff='0',user__is_active='1')
        context['passenger'] = passenger
        return context

class Passenger_Details(TemplateView):
    template_name = 'admin/passenger_details.html'

    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        user = PassengerEntry.objects.filter(user_id=id)
        return render(request,'admin/passenger_details.html',{'passenger_info':user})

class Passenger_Approve(TemplateView):
    template_name = 'admin/passenger_approve.html'

    def get_context_data(self, **kwargs):
        context = super(Passenger_Approve,self).get_context_data(**kwargs)

        new_passenger = PassengerEntry.objects.filter(user__last_name='0',user__is_staff='0',user__is_active='1')

        context['new_passenger'] = new_passenger
        return context

class Feed_Back(TemplateView):
    template_name = 'admin/feedback_action.html'

    def get_context_data(self, **kwargs):
        context = super(Feed_Back, self).get_context_data(**kwargs)
        feedback = Feedback_Passenger.objects.all()
        context['feed'] = feedback
        return context
    def post(self,request,*args,**kwargs):
        iid = request.POST['iid']
        feed = Feedback_Passenger.objects.get(id=iid)
        feedb = request.POST['reply']
        feed.reply = feedb
        feed.status = "replied"
        feed.save()
        return redirect(request.META['HTTP_REFERER'])

class Feed_Back_To(TemplateView):
    template_name = 'admin/feedback_action_owner.html'

    def get_context_data(self, **kwargs):
        context = super(Feed_Back_To, self).get_context_data(**kwargs)
        feedback = Feedback_Owner.objects.all()
        context['feed'] = feedback
        return context
    def post(self,request,*args,**kwargs):
        feedb = request.POST['reply']
        iid = request.POST['iid']
        feed = Feedback_Owner.objects.get(id=iid)
        feed.reply = feedb
        feed.status = "replied"
        feed.save()
        return redirect(request.META['HTTP_REFERER'])


class Notification(TemplateView):
    template_name = 'admin/notification.html'

    def get_context_data(self, **kwargs):
        context = super(Notification, self).get_context_data(**kwargs)

        comment = Comments.objects.filter(passenger__user_id=self.request.user.id)

        context['comment'] = comment
        return context

    def post(self, request, *args, **kwargs):
        id = request.POST['id']
        comment = Comments.objects.get(id=id)
        reply = request.POST['reply']
        comment.reply = reply
        comment.save()
        return redirect(request.META['HTTP_REFERER'])

class Payment_by_Passenger(TemplateView):
    template_name = 'admin/payment_by_passenger.html'
    def get_context_data(self, **kwargs):

        context = super(Payment_by_Passenger, self).get_context_data(**kwargs)
        amount = Offerride.objects.all()
        context['amount'] = amount
        return context

    def post(self,request, *args,**kwargs):
        time = request.POST['time']
        date = request.POST['date']
        pay = Payment()
        pay.time = time
        pay.date = date
        pay.save()
        return render(request,'admin/admin_index.html', {'message':"Payment transaction successfully completed"})


class Payment_action_owner(TemplateView):
    template_name = 'admin/payment_action.html'
    def get_context_data(self, **kwargs):
        context = super(Payment_action_owner, self).get_context_data(**kwargs)
        amount = Offerride.objects.all()
        context['amount'] = amount
        return context

    # def post(self,request, *args,**kwargs):
    #     time = request.POST['time']
    #     date = request.POST['date']
    #     # owner = OwnerEntry.objects.filter(user_id=id)
    #     pay = Payment()
    #     pay.time = time
    #     pay.date = date
    #     # pay.owner = owner
    #     pay.save()
    #     return render(request,'admin/admin_index.html', {'message':"Payment transaction successfully completed"})

class Published_Now(TemplateView):
    template_name = 'admin/published_now.html'

    def get_context_data(self, **kwargs):
        context = super(Published_Now, self).get_context_data(**kwargs)
        published = Offerride.objects.filter(status=0)
        context['publish'] = published
        return context

    # def post(self,request,*args,**kwargs):
    #     iid = request.GET['iid']
    #     off = Offerride.objects.filter(owner_id=request.user.iid)
    #     food2 = request.POST['food2']
    #     pets2 = request.POST['pets2']
    #     smoking2 = request.POST['smoking2']
    #     music2 = request.POST['music2']
    #     offer = Offerride()
    #     offer.off = off
    #     offer.food2 = food2
    #     offer.smoking2 = smoking2
    #     offer.pets2 = pets2
    #     offer.music2 = music2
    #     offer.save()
    #     return render(request, 'admin/admin_index.html', {'message': "successfully completed"})


class Pub_rate(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        offer = Offerride.objects.get(pk=id)
        offer.amount = offer.amount + 80
        offer.save()
        return render(request, 'admin/published_now.html')




class Completed_Rides(TemplateView):
    template_name = 'admin/completed_rides.html'
    def get_context_data(self, **kwargs):
        context = super(Completed_Rides, self).get_context_data(**kwargs)
        published = Offerride.objects.filter(status=1)
        context['publish'] = published
        return context