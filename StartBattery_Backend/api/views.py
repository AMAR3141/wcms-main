from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import Warrent_Claim_Serializer,UserSerializer
from .models import warrenty_claims,User
from rest_framework.decorators import api_view
from django.http import JsonResponse
from rest_framework.pagination import PageNumberPagination
from rest_framework.generics import ListAPIView,RetrieveAPIView
from django.contrib.auth.hashers import make_password,check_password
from rest_framework import status
from rest_framework.exceptions import AuthenticationFailed
import jwt,datetime
import json



# Create your views here.


        


class Warrenty_Claim(ListAPIView):
    
    queryset=warrenty_claims.objects.all()
    serializer_class=Warrent_Claim_Serializer
    paginator_class=PageNumberPagination 

    # def get_queryset(self):
    #     return Response(self.serializer_class(self.queryset,many=True))
    
    # def get(self,reqeust):
        
    #     serialized_data=Warrent_Claim_Serializer(self.queryset,many=True)
        
    #     return Response(serialized_data.data)
    

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

    
    

        
    return JsonResponse({'pending_count':pending_count,'approved_count':approved_count})




class Shop_Users(APIView):

    # queryset=User.objects.all()
    # serializer_class=UserSerializer

    def get(self,request):

        id=self.request.query_params.get('id')
        queryset=User.objects.filter(is_staff=False)
        
        user_serializer=UserSerializer(queryset,many=True)
                            
        if id is not None:
            
            queryset=User.objects.get(id=id)
            
            user_serializer=UserSerializer(queryset,many=False)
            
        
        return Response(user_serializer.data)
    
    def post(self,request):
        data=request.data
        queryset=User.objects.all()

        print(data['file'])
        if queryset.filter(username=data['Username']): 
            Status='UserName Already Exits'
        elif queryset.filter(email=data['Email']):
            Status='Email Already Exits'
        elif queryset.filter(Phone=data['Phone']):
            Status='Phone Number Already Exits'
        else:
            hash_password=make_password(data['Password'])
            response=User.objects.create(username=data['Username'],email=data['Email'],first_name=data['Name'],last_name=data['Surname'],password=hash_password,image=data['file'],Address=data['Address'],Phone=data['Phone'])

                    
            if response:
                Status=status.HTTP_201_CREATED
            else:
                Status=status.HTTP_500_INTERNAL_SERVER_ERROR    
        # except:
        #     status='Eror while submiting'
        
        return Response(Status)
    
    # @api_view(['POST'])
    def delete(self,request):
        id=request.GET['id']
        # id=('id')
        data=User.objects.get(id=id)
        data.delete()
        if data:
            return Response(status=status.HTTP_200_OK)
        else:
            return Response(status=status.HTTP_304_NOT_MODIFIED)
            

                    

    



# API TO Authenticate USERS (LOGIN)
class Auth(APIView):

    def post(self, request):

        UserData = request.data
        try:
            queryset = User.objects.filter(username=UserData['username']).first()

            if queryset is None:
                raise AuthenticationFailed('User Not Found')

            if not queryset.check_password(UserData['password']):
                raise AuthenticationFailed('Incorrect Password')
            
            expire_at = (datetime.datetime.utcnow() + datetime.timedelta(hours=4)).isoformat()
            initialize_at = datetime.datetime.utcnow().isoformat()
            payload = {
                'id': queryset.id,
                'expire': expire_at,
                'int': initialize_at
            }

            token = jwt.encode(payload, 'secret', algorithm='HS256')

            response = Response()
            response.set_cookie(key='jwt', value=token, httponly=True)
            
            response.data = {
                'jwt': token
            }
            return response

        except User.DoesNotExist:
            return Response({'error': 'User Not Found'})

class GetLoginInfo(APIView):

    def get(self, request):
        token = request.COOKIES.get('jwt')
        
        if not token:
            return Response({'error': 'JWT token not found in cookie.'}, status=400)

        try:
            payload = jwt.decode(token, 'secret', algorithms=['HS256'])
        except jwt.ExpiredSignatureError:
            raise AuthenticationFailed('JWT token has expired')

        user_id = payload.get('id')
        user = User.objects.filter(id=user_id).first()

        if not user:
            return Response({'error': 'User not found'}, status=404)

        serialized_data = UserSerializer(user, many=False).data
        
        return Response(serialized_data, status=200)

# class userView(APIView):

    # def get(self, request):
    #     print('hii')
    #     return Response('Hii')
        # token =self.request.query_params.get('id')
        
        # if token is None:
        #     return Response({'error': 'JWT token not found in cookie.'})

        # print(token)
        # try:
        #     # if type(token)==str:
        #         # token=json.dumps(token).encode()
        #     payload = jwt.decode(token, 'secret', algorithms=['HS256'])
        #     print(payload)
        # except jwt.ExpiredSignatureError:
        #     raise AuthenticationFailed('Unauthorized')

        # queryset = User.objects.get(id=payload['id'])
        # serialized_data = UserSerializer(queryset,many=False)

        # return Response(serialized_data.data)
    



class logOut(APIView):

    def post(self,request):
        response=Response()
        response.delete_cookie('jwt')

        response.data={
            'msg':'success'
        }
        return response