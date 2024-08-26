from django.test import TestCase
from django.test import TestCase
from django.urls import reverse
from .models import User
import json
from rest_framework.test import APIClient
from rest_framework import status

# Create your tests here.
class send_registration_email_test(TestCase):
    def setUp(self):
        # 设置测试数据
        # 正数据
        self.valid_payload = {
            'username': 'test',
            'password': 'test',
            'email': '1378832571@qq.com'
        }

        # 创建一个已存在的用户
        User.objects.create(username='TieZhu', email='dcx1378832571@163.com', password='test')

        # 反数据
        self.existing_username = {
            'username': 'TieZhu', # 已存在的用户名
            'password': 'test',
            'email': 'dcx1378832571@163.com'
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

class get_user_info_test(TestCase):
    def setUp(self):
        # 创建测试用户
        self.user = User.objects.create(username='testuser', email='user@example.com', password='password123', zhibi=100)

    def test_get_user_info_success(self):
        # 成功获取用户信息
        url = reverse('get-user-info-url', kwargs={'username': 'testuser'})
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertJSONEqual(
            str(response.content, encoding='utf8'),
            {
                'password': 'password123',
                'email': 'user@example.com',
                'zhibi': 100,
                'photo': self.user.get_used_element()
            }
        )

    def test_invalid_method(self):
        # 测试错误的请求方法
        url = reverse('get-user-info-url', kwargs={'username': 'testuser'})
        response = self.client.post(url)  # 使用POST方法尝试
        self.assertEqual(response.status_code, 405)
        self.assertJSONEqual(
            str(response.content, encoding='utf8'),
            {'error': 'Invalid request method'}
        )

class modify_user_info_test(TestCase):
    def setUp(self):
        # 创建一个已存在的用户
        self.user = User.objects.create(username='testuser', email='user@example.com', password='password123', zhibi=100)

        # 正数据，用于修改用户信息
        self.valid_payload = {
            'username': 'testuser',
            'flag': 1,
            'email': 'user@example.com',
            'password': 'password123'
        }

        # 反数据

        # 错误的请求数据
        self.invalid_payload = {
            'username': 'testuser',
            'flag': -1, #参数不正确
        }

    def test_modify_user_info_success(self):
        # 测试成功修改用户信息
        url = reverse('modify-user-info-url')
        response = self.client.post(url, json.dumps(self.valid_payload), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()['message'], "True")

    def test_invalid_parameters(self):
        # 测试错误的参数
        url = reverse('modify-user-info-url')
        response = self.client.post(url, json.dumps(self.invalid_payload), content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json()['error'], 'Invalid or missing parameters')

class modify_photo_in_shop_test(TestCase):
    def setUp(self):
        # 创建测试用户
        self.user = User.objects.create(username='testuser', email='user@example.com', password='password123', zhibi=100, own_photos=json.dumps(['photo1', 'photo2']))
        self.url = reverse('modify-photo-in-shop-url')

        # 正确的测试数据
        self.valid_payload = {
            'username': 'testuser',
            'photonumber': 1,
            'status': 'newstatus',
            'money': 500
        }

    def test_modify_user_success(self):
        # 测试成功修改用户头像和纸币信息
        response = self.client.post(self.url, json.dumps(self.valid_payload), content_type='application/json')
        self.user.refresh_from_db()
        self.assertEqual(response.status_code, 200)
        self.assertEqual(self.user.zhibi, 500)
        self.assertIn('newstatus', json.loads(self.user.own_photos))

    def test_invalid_json_body(self):
        # 测试提交的 JSON 数据无效
        response = self.client.post(self.url, '{"username": "testuser", "photonumber": "}', content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json()['error'], 'Invalid JSON body')

    def test_invalid_request_method(self):
        # 测试使用非法的请求方法
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')


class user_detail_est(TestCase):
    def setUp(self):
        # 创建测试用户
        self.user = User.objects.create(username='testuser', email='user@example.com', password='password123')
        self.client = APIClient()

    def test_user_detail_view_success(self):
        # 测试成功获取用户信息
        url = reverse('user-detail', kwargs={'username': 'testuser'})
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertJSONEqual(
            str(response.content, encoding='utf8'),
            {
                'username': 'testuser',
                'email': 'user@example.com',
                # 这里假设 UserSerializer 返回的字段，如果有其他字段，也需要加上
            }
        )

    def test_invalid_method(self):
        # 测试错误的请求方法
        url = reverse('user-detail', kwargs={'username': 'testuser'})
        response = self.client.post(url)  # 使用POST方法尝试
        self.assertEqual(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)
        self.assertEqual(response.json()['error'], 'Invalid request method')