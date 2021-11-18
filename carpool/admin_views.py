from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.views import View
from django.db.models import Q
from django.views.generic import TemplateView

from carpool.models import OwnerEntry, PassengerEntry, Comments, SeekRide


class Admin_View(TemplateView):
    template_name = 'admin/admin_index.html'

class Owner_View(TemplateView):
    template_name = 'admin/owner_view.html'

    def get_context_data(self, **kwargs):
        context = super(Owner_View,self).get_context_data(**kwargs)
        owner = OwnerEntry.objects.filter(user__last_name='1',user__is_staff='0',user__is_active='1')
        context['owner'] = owner
        return context

class RejectView(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        user = User.objects.get(pk=id)
        user.last_name='1'
        user.is_active='0'
        user.save()
        return render(request,'admin/admin_index.html',{'message':"Account Removed"})

class ApproveView(View):
    def dispatch(self, request, *args, **kwargs):

        id = request.GET['id']
        user = User.objects.get(pk=id)
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
        feedback = FeedBack.objects.all()
        context['feed'] = feedback
        return context
    def post(self,request,*args,**kwargs):
        iid = request.POST['iid']
        feed = FeedBack.objects.get(id=iid)
        feedb = request.POST['reply']
        feed.reply = feedb
        feed.status = "replied"
        feed.save()
        return redirect(request.META['HTTP_REFERER'])

class Feed_Back_To(TemplateView):
    template_name = 'admin/feedback_action_owner.html'

    def get_context_data(self, **kwargs):
        context = super(Feed_Back_To, self).get_context_data(**kwargs)
        feedback = FeedBack.objects.filter(~Q(owner_id=''))
        # feedback = FeedBack.objects.all()
        context['feed'] = feedback
        return context
    def post(self,request,*args,**kwargs):
        feedb = request.POST['reply']
        iid = request.POST['iid']
        feed = FeedBack.objects.get(id=iid)
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
