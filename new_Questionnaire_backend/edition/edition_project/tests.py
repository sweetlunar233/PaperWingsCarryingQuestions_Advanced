from django.test import TestCase
from django.urls import reverse
from .models import Submission
import json
from rest_framework.test import APIClient

class get_questionnaire_test(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.url = '/questionnaireDesign/7/'  # 直接硬编码URL

    def test_get_questionnaire_success(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)

class display_answer_normal_test(TestCase):
    def setUp(self):
        self.client = APIClient()

    def test_user_not_found(self):
        url = '/normalAnswer/unknownuser/8/5/'  # 直接硬编码URL
        response = self.client.get(url)
        self.assertEqual(response.status_code, 500)

class display_answer_test_test(TestCase):
    def setUp(self):
        self.client = APIClient()

    def test_survey_not_found(self):
        url = '/testAnswer/wly/9999/1/'  # 直接硬编码URL
        response = self.client.get(url)
        self.assertEqual(response.status_code, 500)

class survey_statistics_test(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.url = '/dataPre/7/'  # 直接硬编码URL

    def test_survey_statistics_success(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        response_data = response.json()
        self.assertIn('title', response_data)

    def test_survey_not_found(self):
        url = '/dataPre/999/'  # 直接硬编码URL
        response = self.client.get(url)
        self.assertEqual(response.status_code, 500)

class download_submissions_test(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.url = '/dataPre/download/7/'  # 直接硬编码URL

    def test_download_submissions_success(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)

class check_survey_status_test(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.url = '/edition/check_survey_status/'  # 不需要在URL中添加survey_id

    def test_check_survey_status(self):
        # 模拟发送POST请求并传递survey_id
        data = {'survey_id': 1}
        response = self.client.post(self.url, data)
        self.assertEqual(response.status_code, 200)
        response_data = response.json()
        self.assertIn('is_full', response_data)