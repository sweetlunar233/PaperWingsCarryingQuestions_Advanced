from django.urls import path, include
from user_project import views
from .views import health_check
from drf_spectacular.views import SpectacularAPIView, SpectacularRedocView, SpectacularSwaggerView
  
urlpatterns = [  
    # ... 微服务的健康检查 ...  
    path('health/', views.health_check, name='health_check'),  
    # ... 其他URL配置 ...  

    # YOUR PATTERNS
    path('api/schema/', SpectacularAPIView.as_view(), name='schema'),
    # Optional UI:
    path('api/schema/swagger-ui/', SpectacularSwaggerView.as_view(url_name='schema'), name='swagger-ui'),
    path('api/schema/redoc/', SpectacularRedocView.as_view(url_name='schema'), name='redoc'),
]
