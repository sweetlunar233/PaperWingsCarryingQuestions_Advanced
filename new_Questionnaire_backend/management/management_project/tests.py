from django.test import TestCase
from django.utils import timezone
from .models import Survey, Submission, RewardOffering

import json
from rest_framework.test import APIClient

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
        self.url = '/Manage/square/lorian/1/1/'

    def test_check_qs(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        response_data = response.json()  # 获取完整的响应数据
        self.assertIn('message', response_data)  # 检查'message'字段是否存在
        self.assertIn('content', response_data)

    def test_invalid_request_method(self):
        response = self.client.post(self.url, {})
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')

