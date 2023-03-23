from django.contrib import admin
from.models import warrenty_claims,User
# Register your models here.

admin.site.register(warrenty_claims)
class Admin_Warrenty_Claims(admin.ModelAdmin):

    list_display=('Ticket_no','Name','Middle_Name','Last_Name','contact_no','Battery_brand','Battery_type','Battery_SerialNumber','Status')
    
admin.site.register(User)
class Admin_User(admin.ModelAdmin):

    list_display=('id','Name','Surname','Email','Phone','Address','image','Password')
