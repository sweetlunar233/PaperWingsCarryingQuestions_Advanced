from django.test import TestCase
from django.utils import timezone
from .models import Survey, Submission, RewardOffering
from django.urls import reverse
import json
from rest_framework.test import APIClient



class GetDraftedQsTest(TestCase):
    def setUp(self):
        self.url = '/Manage/unreleased/lorian/'
        self.client = APIClient()

    def test_get_draft_surveys(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        data = response.json().get('data')
        self.assertIsNotNone(data)  # 确保 'data' 键存在
        self.assertTrue(isinstance(data, list))  # 确保 'data' 是列表类型

    def test_invalid_request_method(self):
        response = self.client.post(self.url, {})
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')

class GetReleasedQsTest(TestCase):
    def setUp(self):
        self.url = '/Manage/released/lorian/'
        self.client = APIClient()
    
    def test_invalid_request_method(self):
        response = self.client.post(self.url, {})
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')

class GetFilledQsTest(TestCase):
    def setUp(self):
        self.url = '/Manage/filled/lorian/'
        self.client = APIClient()

    def test_invalid_request_method(self):
        response = self.client.post(self.url, {})
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')

class GetAllReleasedQsTest(TestCase):
    def setUp(self):
        self.url = '/Manage/square/'
        self.client = APIClient()

    def test_get_all_released_surveys(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        data = response.json().get('data')
        self.assertIsNotNone(data)  # 确保 'data' 键存在
        self.assertTrue(isinstance(data, list))  # 确保 'data' 是列表类型

    def test_invalid_request_method(self):
        response = self.client.post(self.url, {})
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')

class delete_unreleased_qs_test(TestCase):
    def setUp(self):
        self.url = reverse('delete-unreleased-qs-url')


    def test_delete_survey_not_found(self):
        response = self.client.post(self.url, json.dumps({'SurveyID': 999}), content_type='application/json')
        self.assertEqual(response.status_code, 500)

    def test_invalid_request_method(self):
        # 测试错误的HTTP方法
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')

class update_or_delete_released_qs(TestCase):
    def setUp(self):
        self.url = reverse('delete-released-qs-url')

    def test_invalid_json_body(self):
        # 测试提交的 JSON 数据无效
        response = self.client.post(self.url, '{"bad_json": "}', content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json()['error'], 'Invalid JSON body')

class delete_filled_qs_test(TestCase):
    def setUp(self):
        self.url = reverse('delete-filled-qs')

    def test_invalid_json_body(self):
        # 测试提交的 JSON 数据无效
        response = self.client.post(self.url, '{"bad_json": "}', content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json()['error'], 'Invalid JSON body')



# class SurveyTests(TestCase):
#     def setUp(self):
#         # self.survey_url = reverse('get_survey', kwargs={'survey_id': 1})
#         self.url = '/survey/7/'
#         self.client = APIClient()

#     def test_get_survey(self):
#         # 测试获取survey的API
#         response = self.client.get(self.url)
#         self.assertEqual(response.status_code,200)

