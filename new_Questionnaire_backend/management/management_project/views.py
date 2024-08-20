from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse  
from django.views.decorators.http import require_http_methods  
  

@require_http_methods(["GET"])  
def health_check(request):  
    # 这里可以添加一些实际的健康检查逻辑  
    # 例如，检查数据库连接、缓存连接等  
    # 如果一切正常，返回200 OK  
    # 如果有错误，返回503 Service Unavailable或其他适当的状态码  
    return JsonResponse({"status": "UP"}, status=200)