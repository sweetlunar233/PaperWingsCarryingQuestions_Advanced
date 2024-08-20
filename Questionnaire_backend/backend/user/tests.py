from django.test import TestCase
from django.urls import reverse
from django.utils import timezone
from .models import User
import json

class send_registration_email_test(TestCase):
    def setUp(self):
        # 设置测试数据
        # 正数据
        self.valid_payload = {
            'username': 'test',
            'password': 'test',
            'email': '1378832571@qq.com'
        }
        # 反数据
        self.existing_username = {
            'username': 'TieZhu', # 已存在的用户名
            'password': 'test',
            'email': False
        }

    def test_register_new_user(self):
        # 测试有效用户注册
        url = reverse('send-registration-email-url') 
        response = self.client.post(url, json.dumps(self.valid_payload), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()['message'], "register success")

    def test_register_with_existing_username(self):
        # 测试已存在用户名注册
        url = reverse('send-registration-email-url')
        response = self.client.post(url, json.dumps(self.existing_username), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()['message'], "same username")

