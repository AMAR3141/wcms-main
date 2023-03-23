from django.urls import path
from .views import Warrenty_Claim,get_Count_Register,Shop_Users
from .models import warrenty_claims
from.serializers import Warrent_Claim_Serializer



urlpatterns = [
    
    path('warrenty-get/',Warrenty_Claim.as_view(queryset=warrenty_claims.objects.all(), serializer_class=Warrent_Claim_Serializer),name='Warrenty_get_all'),
    path('get_Count_Register/',get_Count_Register,name='get_Count_Register'),
    path('users/New/',Shop_Users.as_view(),name='Shop_Users'),
]
