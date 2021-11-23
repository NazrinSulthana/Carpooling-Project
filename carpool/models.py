from django.contrib.auth.models import User
from django.db import models

# Create your models here.

class UserType(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    type = models.CharField(max_length=50)

class OwnerEntry(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    password2 = models.CharField(max_length=100)
    contact = models.CharField(max_length=100)
    dob = models.CharField(max_length=50)
    gender = models.CharField(max_length=50)
    license = models.ImageField(upload_to='images/', null=True)
    image = models.ImageField(upload_to='images/', null=True)

class PassengerEntry(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    password2 = models.CharField(max_length=100)
    contact = models.CharField(max_length=100)
    dob = models.CharField(max_length=50)
    gender = models.CharField(max_length=50)
    adhar = models.ImageField(upload_to='images/', null=True)
    image = models.ImageField(upload_to='images/', null=True)


class Offerride(models.Model):
    owner = models.ForeignKey(OwnerEntry, on_delete=models.CASCADE)
    startlocation = models.CharField(max_length=100)
    endlocation = models.CharField(max_length=100)
    date = models.DateField(blank=True, null=True)
    time = models.TimeField()

class CarDetails(models.Model):
    owner = models.ForeignKey(OwnerEntry, on_delete=models.CASCADE)
    carname = models.CharField(max_length=100)
    seat = models.CharField(max_length=50)
    color = models.CharField(max_length=100)
    carno = models.CharField(max_length=100)

class SeekRide(models.Model):
    passenger = models.ForeignKey(PassengerEntry, on_delete=models.CASCADE)
    leavingfrom = models.CharField(max_length=200)
    leavingto = models.CharField(max_length=200)


class Feedback_Owner(models.Model):
    owner = models.ForeignKey(OwnerEntry, on_delete=models.CASCADE,blank=True, null=True)
    user = models.ForeignKey(UserType, on_delete=models.CASCADE,blank=True, null=True)
    time = models.TimeField(auto_now=True)
    date = models.DateField(auto_now=True)
    reply = models.CharField(max_length=1000)
    status = models.CharField(max_length=500)
    feedback = models.CharField(max_length=1000)

class Feedback_Passenger(models.Model):
    passenger = models.ForeignKey(PassengerEntry, on_delete=models.CASCADE,blank=True, null=True)
    user = models.ForeignKey(UserType, on_delete=models.CASCADE,blank=True, null=True)
    time = models.TimeField(auto_now=True)
    date = models.DateField(auto_now=True)
    reply = models.CharField(max_length=1000)
    status = models.CharField(max_length=500)
    feedback = models.CharField(max_length=1000)

class Comments(models.Model):
    owner = models.ForeignKey(OwnerEntry, on_delete=models.CASCADE)
    passenger = models.ForeignKey(PassengerEntry, on_delete=models.CASCADE)
    ride = models.ForeignKey(SeekRide, on_delete=models.CASCADE)
    comments = models.CharField(max_length=100, null=True)
    reply = models.CharField(max_length=100, null=True)
    time = models.TimeField(auto_now=True)
    date = models.DateTimeField(auto_now=True)
    rate = models.CharField(max_length=100)

class SupportTicket(models.Model):

    name = models.CharField(max_length=100)
    phone_number = models.IntegerField()
    description = models.TextField()

    timestamp = models.DateTimeField(auto_now_add=True)


class Payment(models.Model):
    passenger = models.ForeignKey(PassengerEntry, on_delete=models.CASCADE)
    owner = models.ForeignKey(OwnerEntry, on_delete=models.CASCADE)
    amount = models.CharField(max_length=100)
    time = models.TimeField(auto_now=True)
    date = models.DateTimeField(auto_now=True)
