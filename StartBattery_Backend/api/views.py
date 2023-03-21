from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import Warrent_Claim_Serializer
from .models import warrenty_claims
from rest_framework.decorators import api_view
from django.http import JsonResponse
from rest_framework.pagination import PageNumberPagination
from rest_framework.generics import GenericAPIView

# Create your views here.


        


class Warrenty_Claim(GenericAPIView):
    
    queryset=warrenty_claims.objects.all()
    serializer_class=Warrent_Claim_Serializer
    paginator_class=PageNumberPagination 

    def get_queryset(self):
        return Response(self.serializer_class(self.queryset,many=True))
    
    def get(self,reqeust):
        
        serialized_data=Warrent_Claim_Serializer(self.queryset,many=True)
        
        return Response(serialized_data.data)
    

@api_view(['GET'])
def get_Count_Register(request):

    response=warrenty_claims.objects.all()
    serialized_data=Warrent_Claim_Serializer(response,many=True)
    pending_count=0
    approved_count=0

    for i in range(0,len(response)):
        print(response[i].Status)
        if response[i].Status=='Approved':
            approved_count+=1
        elif response[i].Status=='Pending':
            pending_count+=1

    print(pending_count)
    print(approved_count)

        
    return JsonResponse({'pending_count':pending_count,'approved_count':approved_count})

