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

class ModifyUserInfoTest(TestCase):
    def setUp(self):
        User.objects.create(username='testuser', email='user@example.com', password='password123')
        self.valid_payload = {
            'username': 'testuser',
            'flag': 1,
            'email': 'user@example.com',
            'password': 'password123'
        }
        self.invalid_payload = {
            'username': 'testuser',
            'flag': -1,
        }

    def test_modify_user_info_success(self):
        response = self.client.post('/personal/message/', json.dumps(self.valid_payload), content_type='application/json')
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], "True")

    def test_invalid_parameters(self):
        response = self.client.post('/personal/message/', json.dumps(self.invalid_payload), content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json()['error'], 'Invalid or missing parameters')

class ModifyPhotoInShopTest(TestCase):
    def setUp(self):
        self.user = User.objects.create(username='testuser', email='user@example.com', password='password123', zhibi=100, own_photos=json.dumps(['photo1', 'photo2']))
        self.valid_payload = {
            'username': 'testuser',
            'photonumber': 1,
            'status': 'newstatus',
            'money': 500
        }

    def test_modify_user_success(self):
        response = self.client.post('/personal/shop/', json.dumps(self.valid_payload), content_type='application/json')
        self.user.refresh_from_db()
        self.assertEqual(response.status_code, 200)
        self.assertEqual(self.user.zhibi, 500)
        self.assertIn('newstatus', json.loads(self.user.own_photos))

    def test_invalid_json_body(self):
        response = self.client.post('/personal/shop/', '{"username": "testuser", "photonumber": ""}', content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json()['error'], 'Invalid JSON body')

    def test_invalid_request_method(self):
        response = self.client.get('/personal/shop/')
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')

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


