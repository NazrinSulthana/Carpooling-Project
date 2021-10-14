from django.contrib.auth.models import User
from django.db import models

# Create your models here.

class UserType(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    type = models.CharField(max_length=50)

class OwnerEntry(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    contact = models.CharField(max_length=100)
    dob = models.CharField(max_length=50)
    gender = models.CharField(max_length=50)
    license = models.ImageField(upload_to='images/', null=True)
    image = models.ImageField(upload_to='images/', null=True)

class PassengerEntry(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    contact = models.CharField(max_length=100)
    dob = models.CharField(max_length=50)
    gender = models.CharField(max_length=50)
    adhar = models.ImageField(upload_to='images/', null=True)
    image = models.ImageField(upload_to='images/', null=True)






