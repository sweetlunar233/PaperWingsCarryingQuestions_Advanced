"""
URL configuration for user project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from drf_spectacular.views import SpectacularAPIView, SpectacularJSONAPIView, SpectacularRedocView, SpectacularSwaggerView

urlpatterns = [
    path("admin/", admin.site.urls),
    path('health/',include("user_project.urls")),
]

urlpatterns+=[
    # YOUR PATTERNS

    path('swagger/api/', SpectacularAPIView.as_view(), name='schema-api'),
    path('swagger/json/', SpectacularJSONAPIView.as_view(), name='schema-json'),    
    # Optional UI:    
    path('swagger/ui/', SpectacularSwaggerView.as_view(url_name='schema'), name='swagger-ui'),    
    path('swagger/redoc/', SpectacularRedocView.as_view(url_name='schema'), name='redoc'),
]
