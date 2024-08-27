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
        self.user = User.objects.create(username='testuser', email='user@example.com', password='password123', zhibi=100)
        self.survey = Survey.objects.create(Owner=self.user, Title="Survey", Category=1, Is_released=True, PublishDate=timezone.now(), SurveyID=1, Is_open=True)
        self.url = '/Manage/square/lorian/1/1/'

    def test_submission_exists_and_unsubmitted(self):
        Submission.objects.create(Respondent=self.user, Survey=self.survey, Status='Unsubmitted')
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)

    def test_can_fill_survey(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
