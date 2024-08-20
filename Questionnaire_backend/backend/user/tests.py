from django.test import TestCase
from django.urls import reverse
from django.utils import timezone
from .models import User
import json

class UserRegistrationTest(TestCase):
    def setUp(self):
        # 设置测试数据
        self.valid_payload = {
            'username': 'testuser',
            'password': 'password123',
            'email': 'test@example.com'
        }
        self.existing_user_payload = {
            'username': 'existinguser',
            'password': 'password123',
            'email': 'existing@example.com'
        }
        # 创建已存在的用户
        User.objects.create(username='existinguser', email='existing@example.com', password='password123', CreateDate=timezone.now(), isActive=True)

    def test_register_new_user(self):
        # 测试有效用户注册
        url = reverse('register')  # 假设你的注册视图的 URL 名为 'register'
        response = self.client.post(url, json.dumps(self.valid_payload), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()['message'], "register success")

    def test_register_with_existing_username(self):
        # 测试已存在用户名注册
        url = reverse('register')
        response = self.client.post(url, json.dumps(self.existing_user_payload), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()['message'], "same username")

    def test_register_with_existing_email(self):
        # 测试已存在邮箱注册
        self.existing_user_payload['username'] = 'newuser'  # 改变用户名，但邮箱已存在
        url = reverse('register')
        response = self.client.post(url, json.dumps(self.existing_user_payload), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()['message'], "same email")

    def test_invalid_method(self):
        # 测试非 POST 请求
        url = reverse('register')
        response = self.client.get(url)  # 使用 GET 请求
        self.assertEqual(response.status_code, 200)
        self.assertTrue(response.content)
