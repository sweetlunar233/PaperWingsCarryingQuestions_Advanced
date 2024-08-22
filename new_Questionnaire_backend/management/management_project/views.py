import random
from django.shortcuts import render
from django.http import JsonResponse

# Create your views here.
from .models import Survey, Submission, RewardOffering

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

import requests

from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from .models import Survey
from .serializers import SurveySerializer

from django.views.decorators.http import require_http_methods

userServeAddress='http://172.0.0.1:8000'
managementServeAddress='http://172.0.0.1:8001'
editionServeAddress='http://172.0.0.1:8002'

@require_http_methods(["GET"])  
def health_check(request):  
    # 这里可以添加一些实际的健康检查逻辑  
    # 例如，检查数据库连接、缓存连接等  
    # 如果一切正常，返回200 OK  
    # 如果有错误，返回503 Service Unavailable或其他适当的状态码  
    return JsonResponse({"status": "UP"}, status=200)

#填写记录
def delete_filled_qs(request):
    if(request.method=='POST'):
        try:
            body=json.loads(request.body)
            submissionID=body
            submission=Submission.objects.get(SubmissionID=submissionID)     #对应填写记录
            if submission is None:
                return JsonResponse({'error': 'No ID provided'}, status=400) 
            submission.delete()
            ###############huyanzhe
            id = submission.SubmissionID
            url = f'http://localhost:8002/delete-submission/{id}/'
            try:
                response = requests.post(url)
                response.raise_for_status()
                print(f"Successfully deleted edition service: {response.json()}")
            except requests.exceptions.RequestException as e:
                print(f"Error deleting edition service: {e}")

        except json.JSONDecodeError:  
            return JsonResponse({'error': 'Invalid JSON body'}, status=400)
        except Exception as e:  
            return JsonResponse({'error': str(e)}, status=500) 
    data = {"message": "True"}
    return JsonResponse(data)

def update_or_delete_released_qs(request):
    if(request.method=='POST'):
        try:
            body=json.loads(request.body)
            flag=body['flag']

        #创建者删除已发布的问卷(将问卷状态改为Is_deleted=True)
        #所有该问卷填写者处，该问卷的状态修改为已删除；填写者刷新问卷管理界面，保留被删除项，但无法继续填写
            if flag==1:
                qsID=body['id']
                if qsID is None:
                    return JsonResponse({'error': 'No ID provided'}, status=400) 
                qs=Survey.objects.filter(SurveyID=qsID).first()     #对应问卷
                qs.Is_deleted=True
                qs.Is_released=False
                qs.save()

                submission_query=Submission.objects.filter(SurveyID=qsID)   #该问卷的所有填写记录
            
                # 使用 for 循环遍历 submission_query  
                with transaction.atomic():  # 你可以使用事务确保操作的原子性  
                    for submission in submission_query:  
                        #该填写已提交：状态不变
                        #该填写未提交：填写状态改为'Deleted'(已被创建者删除)
                        if submission.Status=='Unsubmitted':
                            submission.Status='Deleted'
                            submission.save()
                            ##############################################################################
                            # 需要发送通信,使edition改变该填写记录的状态（改为Deleted）huyanzhe
                            ##############################################################################
                            url = f'{editionServeAddress}/update-submission-status/{submission.SubmissionID}'
                            try:
                                response = requests.post(url)
                                response.raise_for_status()
                                print(f"Successfully updated edition service: {response.json()}")
                            except requests.exceptions.RequestException as e:
                                print(f"Error updating edition service: {e}")
                
            
            #更新发布状态
            else:
                qsID=body['id']
                if qsID is None:
                    return JsonResponse({'error': 'No ID provided'}, status=400) 
                qs=Survey.objects.filter(SurveyID=qsID).first()     #对应问卷

                #当前未发布，改为发布状态：
                if qs.Is_open==False:
                    qs.Is_open=True
                
                #当前已发布，撤回
                else:
                    qs.Is_open=False
                qs.save()

        except json.JSONDecodeError:  
            return JsonResponse({'error': 'Invalid JSON body'}, status=400)
        except Exception as e:  
            return JsonResponse({'error': str(e)}, status=500) 
    data={"message":"True"}
    return JsonResponse(data)
    #return JsonResponse({'error': 'Invalid request method'}, status=405)


#删除未发布的问卷(直接从数据库移除)
def delete_unreleased_qs(request):
    if(request.method=='POST'):
        try:
            body=json.loads(request.body)
            qsID=body
            if qsID is None:
                return JsonResponse({'error': 'No ID provided'}, status=400) 
            qs=Survey.objects.filter(SurveyID=qsID).first()
            if qs is None:  
                return JsonResponse({'error': 'No questionnaire found with the given ID'}, status=404)
            qs.delete()


            data={'message':'True'}
            return JsonResponse(data)
        except json.JSONDecodeError:  
            return JsonResponse({'error': 'Invalid JSON body'}, status=400)
        except Exception as e:  
            return JsonResponse({'error': str(e)}, status=500) 
    return JsonResponse({'error': 'Invalid request method'}, status=405)

# 当前用户已创建未发布的问卷
# def get_drafted_qs(request,username):
#     if(request.method=='GET'):
#         user=User.objects.get(username=username)
#         qs_query=Survey.objects.filter(Owner=user,Is_released=False)
#         data_list=[{'Title':survey.Title,'PublishDate':survey.PublishDate,'SurveyID':survey.SurveyID,'Category':survey.Category} for survey in qs_query]
#         data={'data':data_list}
#         return JsonResponse(data)
#     return JsonResponse({'error': 'Invalid request method'}, status=405)
def get_drafted_qs(request, username):
    if request.method == 'GET':
        # 调用 user 项目的 API 获取用户信息
        user_api_url = f'{userServeAddress}/user/{username}'
        try:
            user_response = requests.get(user_api_url)
            user_response.raise_for_status()  # 如果请求失败，将引发 HTTPError
            user_data = user_response.json()
            user_id = user_data.get('UserID')

            # 使用从 user 项目获取的用户 ID 查找问卷
            qs_query = Survey.objects.filter(OwnerID=user_id, Is_released=False)
            data_list = [
                {
                    'Title': survey.Title,
                    'PublishDate': survey.PublishDate,
                    'SurveyID': survey.SurveyID,
                    'Category': survey.Category
                } for survey in qs_query
            ]
            data = {'data': data_list}
            return JsonResponse(data)
        except requests.RequestException as e:
            return JsonResponse({'error': str(e)}, status=500)
    return JsonResponse({'error': 'Invalid request method'}, status=405)

#当前用户发布的问卷
# def get_released_qs(request,username):
#     if(request.method=='GET'):
#         user=User.objects.get(username=username)
#         qs_query=Survey.objects.filter(Owner=user,Is_released=True,Is_deleted=False)    #不显示已删除问卷

        # data_list=[]
        # for survey in qs_query:
        #     submissionCnt=Submission.objects.filter(Survey=survey,Status__in=['Submitted','Graded']).count()  #该问卷已提交的填写份数
        #     data_list.append({'Title':survey.Title,'PublishDate':survey.PublishDate,'SurveyID':survey.SurveyID,
        #             'Category':survey.Category,'Description':survey.Description,'FilledPeople':submissionCnt, 'IsOpening':survey.Is_open})
        # data={'data':data_list}
        # return JsonResponse(data)
#     return JsonResponse({'error': 'Invalid request method'}, status=405)
def get_released_qs(request,username):
    if request.method == 'GET':
        # 调用 user 项目的 API 获取用户信息
        user_api_url = f'{userServeAddress}/user/{username}'
        try:
            user_response = requests.get(user_api_url)
            user_response.raise_for_status()  # 如果请求失败，将引发 HTTPError
            user_data = user_response.json()
            user_id = user_data.get('UserID')

            # 使用从 user 项目获取的用户 ID 查找问卷
            qs_query = Survey.objects.filter(OwnerID=user_id, Is_released=True,Is_deleted=False) #不显示已删除问卷
            data_list=[]
            for survey in qs_query:
                submissionCnt=Submission.objects.filter(SurveyID=survey.SurveyID,Status__in=['Submitted','Graded']).count()  #该问卷已提交的填写份数
                data_list.append({'Title':survey.Title,'PublishDate':survey.PublishDate,'SurveyID':survey.SurveyID,
                        'Category':survey.Category,'Description':survey.Description,'FilledPeople':submissionCnt, 'IsOpening':survey.Is_open})
            data={'data':data_list}
            return JsonResponse(data)
        except requests.RequestException as e:
            return JsonResponse({'error': str(e)}, status=500)
    return JsonResponse({'error': 'Invalid request method'}, status=405)

#当前用户的填写记录(包括被创建者删除的问卷的填写记录)
def get_filled_qs(request,username):
    if(request.method=='GET'):
        # 调用 user 项目的 API 获取用户信息
        user_api_url = f'{userServeAddress}/user/{username}/'
        try:
            user_response = requests.get(user_api_url)
            user_response.raise_for_status()  # 如果请求失败，将引发 HTTPError
            user_data = user_response.json()
            user_id = user_data.get('UserID')

            submission_query=Submission.objects.filter(RespondentID=user_id)
            data_list=[]

            # 使用 for 循环遍历 submission_query  
            with transaction.atomic():  # 你可以使用事务确保操作的原子性  
                for submission in submission_query:
                    status=submission.Status
                    if status=="Unsubmitted":
                        status_Chinese="未提交"
                    elif status=="Submitted" or status=="Graded":
                        status_Chinese="已提交"
                    else:
                        status_Chinese="已删除"
                    # 新加的
                    data_list.append({'Title':submission.Survey.Title,'PublishDate':submission.SubmissionTime,
                                    'SurveyID':submission.Survey.SurveyID,'Category':submission.Survey.Category,
                                    'Description':submission.Survey.Description,'Status':status_Chinese,
                                    'SubmissionID':submission.SubmissionID})
            data={'data':data_list}
            return JsonResponse(data)
        except requests.RequestException as e:
            return JsonResponse({'error': str(e)}, status=500)
    return JsonResponse({'error': 'Invalid request method'}, status=405)

#问卷管理界面：进入填写时，检查当前问卷的Is_open状态；若为False，则创建者已暂停收集，不可再填写
def check_qs_open_stautus(request,questionnaireId):
    qs=Survey.objects.get(SurveyID=questionnaireId)
    if qs is None:
        return HttpResponse(content="Questionnaire not found",status=404)
    if qs.Is_open==False:
        data={"message":False,"content":"该问卷已暂停收集"}
        return JsonResponse(data)
    else:
        data={"message":True,"content":"可开始/修改填写"}

#问卷广场：检查投票/考试问卷
def check_qs(request,username,questionnaireId,type):
    # 调用 user 项目的 API 获取用户信息
    user_api_url = f'{userServeAddress}/user/{username}/'
    try:
        user_response = requests.get(user_api_url)
        user_response.raise_for_status()  # 如果请求失败，将引发 HTTPError
        user_data = user_response.json()
        user_id = user_data.get('UserID')
    except requests.RequestException as e:
        return JsonResponse({'error': str(e)}, status=500)
    if user_data is None:
        return HttpResponse(content="User not found",status=404)
    qs=Survey.objects.get(SurveyID=questionnaireId)
    if qs is None:
        return HttpResponse(content="Questionnaire not found",status=404)
    
    #投票问卷:每个用户只可提交一次
    if qs.Category==1:
        submission_query=Submission.objects.filter(RespondentID=user_id,Survey=qs)
        if submission_query.exists():
            submission=submission_query.first()
            if submission.Status=='Unsubmitted':
                data={'message':False,"content":"对于当前问卷，您有未提交的填写记录"}
            elif submission.Status=='Submitted':
                data={'message':False,"content":"您完成投票，不可重复投票"}
            else:
                data={'message':False,"content":"当前问卷已被撤回"}
        else:
            data={'message':"True","content":"可以开始/继续填写"}
        return JsonResponse(data)
    
    #考试问卷：每个用户只可提交一次
    elif qs.Category==3:
        submission_query=Submission.objects.filter(RespondentID=user_id,Survey=qs)
        if submission_query.exists():
            submission=submission_query.first()
            if submission.Status=='Unsubmitted':
                data={'message':False,"content":"对于当前问卷，您有未提交的填写记录"}
            elif submission.Status=='Graded':
                data={'message':False,"content":"您已完成当前考试"}
            else:
                data={'message':False,"content":"当前问卷已被撤回"}
        else:
            data={'message':"True","content":"可以开始/继续填写"}
        return JsonResponse(data)
    
    #报名问卷：超过人数，不可以再报名
    elif qs.Category==2:
        print("TieZhu")
        #检查是否超人数(检查每个必填选择题的所有选项，是否都超人数)
        submission_query=Submission.objects.filter(RespondentID=user_id,Survey=qs)

        edition_api_url = f'{editionServeAddress}/check-survey-status'
        payload = {'survey_id': qs.SurveyID}
        try:
            response = requests.post(edition_api_url, json=payload)
            response.raise_for_status()
            result = response.json()
            if result.get('is_full')==True:
                data={'message':False,"content":"当前报名人数已满"}
                return JsonResponse(data)
        except requests.exceptions.RequestException as e:
            print(f"An error occurred: {e}")
            return None
        
        # choiceQuestion_query=ChoiceQuestion.objects.filter(Survey=qs,Category__in=[1,2],IsRequired=True)

        # if choiceQuestion_query.exists():
        #     #每个必填选项
        #     for choiceQuestion in choiceQuestion_query:
        #         isFull=True
        #         choiceOption_query=ChoiceOption.objects.filter(Question=choiceQuestion)
        #         #每个选项的剩余人数
        #         for choiceOption in choiceOption_query:
        #             print(choiceOption.MaxSelectablePeople)
        #             if choiceOption.MaxSelectablePeople>0:
        #                 isFull=False
                
                # if isFull==True:
                #     data={'message':False,"content":"当前报名人数已满"}
                #     return JsonResponse(data)

        '''
        currentCnt=Submission.objects.filter(Respondent=user,Survey=qs).count()

        if currentCnt>=qs.QuotaLimit:
            data={'message':False,"content":"当前报名人数已满"}
            return JsonResponse(data)
        '''

        #检查是否有未提交的填写记录
        unsubmitted_query=Submission.objects.filter(RespondentID=user_id,Survey=qs,Status="Unsubmitted")
        if unsubmitted_query.exists():
            data={'message':False,"content":"对于当前问卷，您有未提交的填写记录"}
        
        data={'message':"True","content":"可以开始/继续填写"}
        return JsonResponse(data)   

    #普通问卷
    else: 
        #检查是否有未提交的填写记录
        unsubmitted_query=Submission.objects.filter(RespondentID=user_id,Survey=qs,Status="Unsubmitted")
        if unsubmitted_query.exists():
            data={'message':False,"content":"对于当前问卷，您有未提交的填写记录"}
        else:
            data={'message':"True","content":"可以开始/继续填写"}

        return JsonResponse(data)   
    
#问卷广场：所有问卷
def get_all_released_qs(request):
    if(request.method=='GET'):
        qs_query=Survey.objects.filter(Is_released=True,Is_open=True).order_by("-PublishDate")
        data_list=[]

        for survey in qs_query:
            reward=RewardOffering.objects.filter(Survey=survey).first()
            if reward is not None:
                data_list.append({'Title':survey.Title,'PostMan':survey.Owner.username,'PublishDate':survey.PublishDate,
                                  'SurveyID':survey.SurveyID,'categoryId':survey.Category,'Description':survey.Description,
                                  'Reward':reward.Zhibi,'HeadCount':reward.AvailableQuota})
            else:
                data_list.append({'Title':survey.Title,'PostMan':survey.Owner.username,'PublishDate':survey.PublishDate,
                                  'SurveyID':survey.SurveyID,'categoryId':survey.Category,'Description':survey.Description,
                                  'Reward':None})
        data={'data':data_list}
        return JsonResponse(data)
    return JsonResponse({'error': 'Invalid request method'}, status=405)

@api_view(['GET'])
def get_survey(request, survey_id):
    try:
        survey = Survey.objects.get(SurveyID=survey_id)
    except Survey.DoesNotExist:
        return Response({'error': 'Survey not found'}, status=status.HTTP_404_NOT_FOUND)

    serializer = SurveySerializer(survey)
    return Response(serializer.data)
