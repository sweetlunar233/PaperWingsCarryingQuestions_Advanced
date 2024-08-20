from django.urls import path, include
from analysis_project import views
from .views import health_check

  
urlpatterns = [  
    # ... 其他URL配置 ...  
    path('health/', views.health_check, name='health_check'),  
    # ... 其他URL配置 ...  
]