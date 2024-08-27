from django.test import TestCase
from .models import User
import json
from rest_framework.test import APIClient
from rest_framework import status

class SendRegistrationEmailTest(TestCase):
    def setUp(self):
        self.valid_payload = {
            'username': 'test',
            'password': 'test',
            'email': '1378832571@qq.com'
        }
        User.objects.create(username='TieZhu', email='dcx1378832571@163.com', password='test')
        self.existing_username = {
            'username': 'TieZhu',
            'password': 'test',
            'email': 'dcx1378832571@163.com'
        }

    def test_register_new_user(self):
        response = self.client.post('/personal/login/', json.dumps(self.valid_payload), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()['message'], "register success")

    def test_register_with_existing_username(self):
        response = self.client.post('/personal/login/', json.dumps(self.existing_username), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()['message'], "same username")

class GetUserInfoTest(TestCase):
    def setUp(self):
        self.user = User.objects.create(username='testuser', email='user@example.com', password='password123', zhibi=100)

    def test_get_user_info_success(self):
        response = self.client.get('/personal/testuser/')
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
        response = self.client.post('/personal/testuser/')
        self.assertEqual(response.status_code, 405)
        self.assertJSONEqual(
            str(response.content, encoding='utf8'),
            {'error': 'Invalid request method'}
        )

class UserDetailTest(TestCase):
    def setUp(self):
        self.user = User.objects.create(username='testuser', email='user@example.com', password='password123')
        self.client = APIClient()

    def test_user_detail_view_success(self):
        response = self.client.get('/user/username/testuser/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.json()['username'],'testuser')
        self.assertEqual(response.json()['email'],'user@example.com')
        self.assertEqual(response.json()['password'],'password123')

    def test_invalid_method(self):
        response = self.client.post('/user/username/testuser/')
        self.assertEqual(response.status_code, 405)

class UserDetailViewIDTest(TestCase):
    def setUp(self):
        # 创建一个用户以便测试
        self.client = APIClient()
        self.user = User.objects.create(username='testuser', email='user@example.com', password='password123')
        self.user_id = self.user.pk  # 获取创建用户的主键ID

    def test_get_user_success(self):
        # 测试获取现有用户的详细信息
        response = self.client.get(f'/user/userid/{self.user_id}/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.json()['username'],'testuser')
        self.assertEqual(response.json()['email'],'user@example.com')
        self.assertEqual(response.json()['password'],'password123')

    def test_user_not_found(self):
        # 测试当用户不存在时的情况
        response = self.client.get('/user/userid/999999/')  # 使用一个肯定不存在的用户ID
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.assertEqual(response.data, {'error': 'User not found'})

class SaveUserTest(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.user = User.objects.create(username='testuser', email='user@example.com', password='password123', zhibi=100)
        self.url = '/user/user_save/'  # 直接使用硬编码的URL路径

    def test_save_user_success(self):
        payload = {'UserID': self.user.UserID, 'zhibi': 200}
        response = self.client.post(self.url, json.dumps(payload), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {'message': 'True'})

    def test_invalid_json(self):
        response = self.client.post(self.url, '{bad json:', content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(), {'error': 'Invalid JSON body'})

    def test_invalid_request_method(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json(), {'error': 'Invalid request method'})

