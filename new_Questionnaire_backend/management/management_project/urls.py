from django.urls import path, include
from management_project import views
from .views import health_check
from .views import get_survey
from .views import UpdateSurvey

  
urlpatterns = [  
    # ... 其他URL配置 ...  
    path('health/', views.health_check, name='health_check'),  
    # ... 其他URL配置 ...  

    #问卷管理界面：返回内容
    path('Manage/unreleased/<str:username>/',views.get_drafted_qs,name='get-drafted-qs-url'),
    path('Manage/released/<str:username>/',views.get_released_qs,name='get-released-qs-url'),
    path('Manage/filled/<str:username>/',views.get_filled_qs,name='get-filled-qs-url'),
    path('Manage/square/',views.get_all_released_qs,name='get-all-released-qs-url'),
    path('Manage/square/<str:username>/<int:questionnaireId>/<int:type>/',views.check_qs,name='check-qs-url'),
    #path('userManage/filled/<int:surveyID>',views.check_qs_open_stautus,name='check-qs-open-stautus-url'),

    #问卷管理界面：删除
    path('Manage/unreleased/',views.delete_unreleased_qs,name='delete-unreleased-qs-url'),
    path('Manage/released/',views.update_or_delete_released_qs,name='delete-released-qs-url'),
    path('Manage/filled/',views.delete_filled_qs,name='delete-filled-qs'),

    # 微服务通信：获取surveyID
    path('survey/<int:survey_id>/', get_survey, name='get_survey'),
    path('survey/update_survey/', UpdateSurvey, name='update_survey'),
    path('survey/submission_save/',views.save_submission, name='save-submission-url'),    #传入待保存的submission信息
]