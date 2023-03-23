from rest_framework.serializers import ModelSerializer
from .models import warrenty_claims,User




class Warrent_Claim_Serializer(ModelSerializer):


    class Meta:
        model=warrenty_claims
        fields='__all__'



class UserSerializer(ModelSerializer):

    class Meta:
        model=User
        fields='__all__'



