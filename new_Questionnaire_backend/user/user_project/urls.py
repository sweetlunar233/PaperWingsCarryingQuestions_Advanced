from django.urls import path, include
from user_project import views
from .views import health_check
from .views import UserDetailView
from .views import UserDetailViewID
  
urlpatterns = [  
    # ... 微服务的健康检查 ...  
    path('health/', views.health_check, name='health_check'),  
    # ... 其他URL配置 ...  

    path('personal/login/', views.send_registration_email, name="send-registration-email-url"),
    path('personal/<str:username>/',views.get_user_info,name='get-user-info-url'),
    path('personal/message/',views.modify_user_info,name='modify-user-info-url'),
    path('personal/shop/',views.modify_photo_in_shop,name='modify-photo-in-shop-url'),
    
    path('user/<str:username>/', UserDetailView, name='user-detail'),
    path('user/<int:UserID>/', UserDetailViewID, name='user-detail-id'),
]
