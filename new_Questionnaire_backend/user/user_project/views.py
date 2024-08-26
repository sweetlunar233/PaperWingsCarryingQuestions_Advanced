from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse  
from django.views.decorators.http import require_http_methods  

import random
from django.shortcuts import render
from django.http import JsonResponse

# Create your views here.
from .models import User

import json
from django.core.mail import BadHeaderError, send_mail
from django.http import HttpResponse, HttpResponseRedirect

from django.core.mail import EmailMessage

from itsdangerous import URLSafeTimedSerializer as utsr
import base64
from django.conf import settings as django_settings
from django.utils import timezone
from django.db import transaction 

from rest_framework.views import APIView
import itertools

from itertools import chain  
from operator import attrgetter 

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import User
from rest_framework.decorators import api_view
from .serializers import UserSerializer

userServeAddress='http://81.70.184.96:7000'
managementServeAddress='http://81.70.184.96:7001'
editionServeAddress='http://81.70.184.96:7002'

serveAddress='http://81.70.184.96:7000'

@require_http_methods(["GET"])  
def health_check(request):  
    # 这里可以添加一些实际的健康检查逻辑  
    # 例如，检查数据库连接、缓存连接等  
    # 如果一切正常，返回200 OK  
    # 如果有错误，返回503 Service Unavailable或其他适当的状态码  
    return JsonResponse({"status": "UP"}, status=200)

'''个人中心界面'''
#购买商店中的头像
def modify_photo_in_shop(request):
    if(request.method=='POST'):
        try:
            body=json.loads(request.body)
            username=body['username']
            user=User.objects.get(username=username)
            if user is None:
                return JsonResponse({'error': 'No user found'}, status=400) 
            
            photonumber = body['photonumber']
            status = body['status']
            #修改头像
            photonumber = body['photonumber']
            status = body['status']
            user.set_array_element(photonumber,status)

            #修改纸币
            zhibi=body['money']
            user.zhibi=zhibi
            user.save()
            
            photos_data = json.loads(user.own_photos)  
            data={'ownphotos':photos_data}
            return JsonResponse(data)

        except json.JSONDecodeError:  
            return JsonResponse({'error': 'Invalid JSON body'}, status=400)
        except Exception as e:  
            return JsonResponse({'error': str(e)}, status=500) 
    return JsonResponse({'error': 'Invalid request method'}, status=405)

#获取个人信息
def get_user_info(request,username):
    print('###')
    if(request.method=='GET'):
        try:
            print('***')
            user=User.objects.get(username=username)
            if user is None:
                return JsonResponse({'error': 'No user found'}, status=400) 
            
            photo=user.get_used_element()
            data={'password':user.password,'email':user.email,'zhibi':user.zhibi,'photo':photo}
            return JsonResponse(data)
        except json.JSONDecodeError:  
            return JsonResponse({'error': 'Invalid JSON body'}, status=400)
        except Exception as e:  
            return JsonResponse({'error': str(e)}, status=500) 
    return JsonResponse({'error': 'Invalid request method'}, status=405)

#修改个人信息
def modify_user_info(request):
    if(request.method=='POST'):
        try:
            body=json.loads(request.body)
            username=body['username']
            flag=body['flag']
            user=User.objects.get(username=username)
            if user is None:
                return JsonResponse({'error': 'No user found'}, status=400) 

            #修改除头像外的其他信息
            if flag==1:
                email=body['email']
                password=body['password']
                user.email=email
                user.password=password
                user.save()
            
            #修改头像：
            elif flag==2:
                photonumber = body['photonumber']
                status = body['status']
                user.set_array_element(photonumber,status)
                user.save()
            
            else:
                # 参数不正确或缺失  
                return JsonResponse({'error': 'Invalid or missing parameters'}, status=400)

        except json.JSONDecodeError:  
            return JsonResponse({'error': 'Invalid JSON body'}, status=400)
        except Exception as e:  
            return JsonResponse({'error': str(e)}, status=500) 
    data={"message":"True"}
    return JsonResponse(data)


class Token:
    def __init__(self, security_key):
        self.security_key = security_key
        # salt是秘钥的编码
        self.salt = base64.encodebytes(security_key.encode('utf-8'))
        #security_key是settings.py中SECURITY_KEY
        #salt是经过base64加密的SECURITY_KEY

    # 生成token,token中可以保存一段信息，这里我们选择保存username
    def generate_validate_token(self, username):
        serializer = utsr(self.security_key)            #生成令牌serializer
        return serializer.dumps(username, self.salt)    #username在令牌中被编码
        #将带有token的验证链接发送至注册邮箱

    # 验证token
    def confirm_validate_token(self, token, expiration=3600):
        serializer = utsr(self.security_key)
        return serializer.loads(token, salt=self.salt, max_age=expiration)

    # 删除token
    def remove_validate_token(self, token):
        serializer = utsr(self.security_key)
        return serializer.loads(token, salt=self.salt)

token_confirm = Token(django_settings.SECRET_KEY)
def get_token(request):

    url = serveAddress+'user/' + token_confirm.generate_validate_token(username='username')+'/'
    '''此处将这个url发送到客户邮箱，我们这里就不进行邮件发送的操作了'''
    return HttpResponse(status=200,content=True)

def send_registration_email(request):
    print("lorian")
    if(request.method=='POST'):
        print("lorian")
        body=json.loads(request.body)
        username=body['username']
        password=body['password']
        email=body['email']

        print(username)
        print(password)
        print(email)

        if(email==False):
            # print("!")
            user_queryset=User.objects.filter(username=username)
            user=user_queryset.first()
            #return HttpResponse(status=200,content=username)
            if not user_queryset.exists():
                data={'message':"1"}
                return JsonResponse(data)
                #return HttpResponse(status=200,content="1")
            elif(password!=user.password):
                data={'message':"2"}
                return JsonResponse(data)
                #return HttpResponse(status=200,content="2")
            else:
                photos_data = json.loads(user.own_photos)  
                data={
                    'message':"0",
                    'username':user.username,
                    'password':user.password,
                    'email':user.email,
                    'ownphotos':photos_data,
                    'zhibi':user.zhibi,
                }
            return JsonResponse(data)

        user1=User.objects.filter(username=username)
        if user1.exists():
            # print("!")
            data={
                'message': "same username",
            }
            return JsonResponse(data)
        
        user2=User.objects.filter(email=email)
        if user2.exists():
            # print("!!")
            data={
                'message': "same email",
            }
            return JsonResponse(data)

        #创建新用户(尚未邮箱验证,非有效用户)
        user=User.objects.create(username=username,email=email,
                                     password=password,CreateDate=timezone.now(),isActive=False)
        user.save()

        #生成令牌
        token = token_confirm.generate_validate_token(username)
        #active_key = base64.encodestring(userName)
        url="/login"

        #发送邮件
        subject="'纸翼传问'新用户注册"
        message=("Hello,"+username+"! 欢迎注册“纸翼传问”!\n"
                     +"请点击以下链接，以激活新账户:\n"
                     +serveAddress+url+token)

        email=EmailMessage(subject=subject,body=message,from_email="1658441344@qq.com",
                            to=[email],reply_to=["1658441344@qq.com"])
        #email.attach_file('/images/weather_map.png')
        email.send()

        data={
            'message': "register success",
        }
        return JsonResponse(data)
    return HttpResponse(status=200,content=True)

#用户点击邮箱链接,调用视图activate_user(),验证激活用户:
def activate_user(request,token):
    try:username=token_confirm.confirm_validate_token(token)
    except:
        return HttpResponse("抱歉，验证链接已过期，请重新注册。")
    try:user=User.objects.get(username=username)
    except User.DoesNotExist:
        return HttpResponse("抱歉，当前用户不存在，请重新注册。")
    user.is_active=True
    user.save()
    return HttpResponse(status=200,content=True)

# class UserDetailView(APIView):
#     def get(self, request, *args, **kwargs):
#         try:
#             print('aaa')
#             username=kwargs.get('username')
#             user = User.objects.get(username=username)
            
#             serializer = UserSerializer(user)
#             return Response(serializer.data, status=status.HTTP_200_OK)
#         except User.DoesNotExist:
#             return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)
        
@api_view(['GET'])
def UserDetailView(request, username):
    try:
        print('aaa')
        user = User.objects.get(username=username)
        serializer = UserSerializer(user)
        return Response(serializer.data, status=status.HTTP_200_OK)
    except User.DoesNotExist:
        return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)

@api_view(['GET'])
def UserDetailViewID(request, UserID):
    try:
        print('aaa')
        user = User.objects.get(UserID=UserID)
        serializer = UserSerializer(user)
        return Response(serializer.data, status=status.HTTP_200_OK)
    except User.DoesNotExist:
        return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)
    

def save_user(request):
    if(request.method=='POST'):
        try:
            body=json.loads(request.body)
            user=User.objects.get(UserID=body['UserID'])
            if user is None:
                return HttpResponse(content='User not found',status=404)
            
            user.zhibi=body['zhibi']
            user.save()

            data={'message':'True'}
            return JsonResponse(data)
        except json.JSONDecodeError:  
            return JsonResponse({'error': 'Invalid JSON body'}, status=400)
        except Exception as e:  
            return JsonResponse({'error': str(e)}, status=500) 
    return JsonResponse({'error': 'Invalid request method'}, status=405)
    