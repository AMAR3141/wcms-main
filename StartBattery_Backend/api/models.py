from django.db import models
from django.contrib.auth.models import AbstractUser
# from django.


# Create your models here.


class warrenty_claims(models.Model):

    Ticket_no=models.IntegerField(primary_key=True)
    Name=models.CharField(max_length=100)
    Middle_Name=models.CharField(max_length=100)
    Last_Name=models.CharField(max_length=100)
    contact_no=models.CharField(max_length=100,unique=True)
    Battery_brand=models.CharField(max_length=100)
    Battery_type=models.CharField(max_length=100)
    Battery_SerialNumber=models.CharField(max_length=100,unique=True)
    Status=models.CharField(max_length=100)


    def __str__(self) :
        return self.Name +' ' + self.Last_Name



class User(AbstractUser):
    
    # Username=models.CharField(max_length=100,unique=True)
    # Name=models.CharField(max_length=100)
    # Surname=models.CharField(max_length=100)
    # Email=models.EmailField(unique=True)
    # Password=models.CharField(max_length=15)
    Phone=models.CharField(max_length=15,unique=True)
    Address=models.TextField()
    image=models.ImageField(upload_to='userImg/',null=True,blank=True,default='')


    def __str__(self) :
        return self.username

