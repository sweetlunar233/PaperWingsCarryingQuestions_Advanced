from django.urls import path, include
from edition_project import views
from .views import health_check
from .views import GetStoreFillView
from .views import GetQuestionnaireView 

  
urlpatterns = [  
    # ... 其他URL配置 ...  
    path('health/', views.health_check, name='health_check'),  
    # ... 其他URL配置 ...  

    #问卷编辑界面：
    path('questionnaireDesign',views.save_qs_design,name='save-qs-design-url'),
    path('questionnaireDesign/<int:survey_id>/', GetQuestionnaireView.as_view(), name='get_questionnaire'),

    #问卷填写界面：
    path('questionnaireFill/<str:userName>/<str:surveyID>/<str:submissionID>', GetStoreFillView.as_view(), name='get-store-fill-url'),
    path('questionnaireFill',views.get_submission,name='post-submission-url'),
    #path('questionnaireFill/<str:userName>/<int:surveyID>/<int:submissionID>', GetStoreFillView.as_view(), name='get-store-fill-url'),

    #问卷展示界面：
    path('normalAnswer/<str:username>/<str:questionnaireId>/<str:submissionId>',views.display_answer_normal,name='display-answer-normal'),
    path('testAnswer/<str:username>/<str:questionnaireId>/<str:submissionId>',views.display_answer_test,name='display-answer-test'),

    #数据分析:
    path('dataPre/<int:QuestionID1>/<int:QuestionID2>',views.cross_analysis,name='cross-analysis-url'),
    path('dataPre/<int:surveyID>',views.survey_statistics,name='survey-statistics-url'),
    path('dataPre/download/<int:surveyID>',views.download_submissions,name='download_submissions-url')
]