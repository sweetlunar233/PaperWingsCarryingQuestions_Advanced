from django.urls import path, include
from user_project import views
from .views import health_check
from .views import UserDetailView
  
urlpatterns = [  
    # ... 微服务的健康检查 ...  
    path('health/', views.health_check, name='health_check'),  
    # ... 其他URL配置 ...  

    path('login', views.send_registration_email, name="send-registration-email-url"),
    path('userManage/personal/<str:username>',views.get_user_info,name='get-user-info-url'),
    path('personal/message',views.modify_user_info,name='modify-user-info-url'),
    path('personal/shop',views.modify_photo_in_shop,name='modify-photo-in-shop-url'),
    path('api/user/<str:username>/', UserDetailView.as_view(), name='user-detail'),
]
