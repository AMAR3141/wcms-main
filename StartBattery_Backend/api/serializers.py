from rest_framework.serializers import ModelSerializer
from .models import warrenty_claims




class Warrent_Claim_Serializer(ModelSerializer):


    class Meta:
        model=warrenty_claims
        fields='__all__'



