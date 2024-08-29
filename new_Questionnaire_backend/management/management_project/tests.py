from django.test import TestCase
from django.utils import timezone
from .models import Survey, Submission, RewardOffering
from django.urls import reverse
import json
from rest_framework.test import APIClient

# ---- 返回内容 ---- #

class GetDraftedQsTest(TestCase):
    def setUp(self):
        self.url = '/Manage/unreleased/lorian/'

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

    def test_get_released_surveys(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        data = response.json().get('data')
        self.assertIsNotNone(data)  # 确保 'data' 键存在
        self.assertTrue(isinstance(data, list))  # 确保 'data' 是列表类型
    
    def test_invalid_request_method(self):
        response = self.client.post(self.url, {})
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')

class GetFilledQsTest(TestCase):
    def setUp(self):
        self.url = '/Manage/filled/lorian/'

    def test_get_filled_surveys(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        data = response.json().get('data')
        self.assertIsNotNone(data)  # 确保 'data' 键存在
        self.assertTrue(isinstance(data, list))  # 确保 'data' 是列表类型

    def test_invalid_request_method(self):
        response = self.client.post(self.url, {})
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')

class GetAllReleasedQsTest(TestCase):
    def setUp(self):
        self.url = '/Manage/square/'

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

class CheckQsTest(TestCase):
    def setUp(self):

        self.url = reverse('check-qs-url', kwargs={'username': 'lorian', 'questionnaireId': 16,'type':1})

    def test_check_qs(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        response_data = response.json()  # 获取完整的响应数据
        self.assertIn('message', response_data)  # 检查'message'字段是否存在
        self.assertIn('content', response_data)

    def test_invalid_request_method(self):
        response = self.client.post(self.url)
        self.assertEqual(response.status_code, 500)

# ---- 删除 ---- #

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

    # def test_update_released_survey_status(self):
    #     # 测试更新问卷发布状态
    #     data = {'flag': 2, 'id': 1}
    #     response = self.client.post(self.url, json.dumps(data), content_type='application/json')
    #     self.assertEqual(response.status_code, 200)

    def test_invalid_json_body(self):
        # 测试提交的 JSON 数据无效
        response = self.client.post(self.url, '{"bad_json": "}', content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json()['error'], 'Invalid JSON body')

class delete_filled_qs_test(TestCase):
    def setUp(self):
        self.url = reverse('delete-filled-qs')

    # def test_delete_submission(self):
    #     # 测试成功删除提交记录
    #     data = 1
    #     response = self.client.post(self.url, json.dumps(data), content_type='application/json')
    #     self.assertEqual(response.status_code, 200)
    #     self.assertEqual(response.json()['message'], "True")

    def test_invalid_json_body(self):
        # 测试提交的 JSON 数据无效
        response = self.client.post(self.url, '{"bad_json": "}', content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json()['error'], 'Invalid JSON body')

# ---- 获取surveyID ---- #

class SurveyTests(TestCase):
    def setUp(self):
        self.survey_url = reverse('get_survey', kwargs={'survey_id': 16})

    def test_get_survey(self):
        # 测试获取survey的API
        response = self.client.get(self.survey_url)
        self.assertEqual(response.status_code,200)

