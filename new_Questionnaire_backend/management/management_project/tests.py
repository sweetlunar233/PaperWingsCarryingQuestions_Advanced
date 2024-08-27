from django.test import TestCase
from django.utils import timezone
from .models import Survey, Submission, RewardOffering
from django.urls import reverse
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

# class CheckQsTest(TestCase):
#     def setUp(self):
#         id = 1
#         self.url = reverse('check-qs-url', kwargs={'username': 'lorian', 'questionnaireId': 1,'type':1})

#     def test_check_qs(self):
#         response = self.client.get(self.url)
#         self.assertEqual(response.status_code, 200)
#         response_data = response.json()  # 获取完整的响应数据
#         self.assertIn('message', response_data)  # 检查'message'字段是否存在
#         self.assertIn('content', response_data)

#     def test_invalid_request_method(self):
#         response = self.client.post(self.url, {})
#         self.assertEqual(response.status_code, 405)
#         self.assertEqual(response.json()['error'], 'Invalid request method')

# ---- Delete ---- #

# class delete_unreleased_qs_test(TestCase):
#     def setUp(self):
#         self.url = reverse('delete_unreleased_qs_url')  # 假设你有为这个视图设置URL名称


#     def test_delete_survey_not_found(self):
#         response = self.client.post(self.url, json.dumps({'SurveyID': 999}), content_type='application/json')
#         self.assertEqual(response.status_code, 404)
#         self.assertEqual(response.json()['error'], 'No questionnaire found with the given ID')

#     def test_invalid_request_method(self):
#         # 测试错误的HTTP方法
#         response = self.client.get(self.url)
#         self.assertEqual(response.status_code, 405)
#         self.assertEqual(response.json()['error'], 'Invalid request method')

# class update_or_delete_released_qs(TestCase):
#     def setUp(self):
#         # 创建测试用户和问卷
#         self.user = User.objects.create(username='testuser', email='user@example.com', password='password123', zhibi=100)
#         self.survey = Survey.objects.create(Owner=self.user, SurveyID=1, Is_released=True, Is_open=True, Is_deleted=False)
#         self.url = reverse('delete-released-qs-url')

#         # 创建相关的提交记录
#         self.submission = Submission.objects.create(Survey=self.survey, Respondent=self.user, Status='Unsubmitted')

#     def test_delete_released_survey(self):
#         # 测试删除已发布的问卷
#         data = {'flag': 1, 'id': 1}
#         response = self.client.post(self.url, json.dumps(data), content_type='application/json')
#         self.survey.refresh_from_db()
#         self.submission.refresh_from_db()
#         self.assertEqual(response.status_code, 200)
#         self.assertTrue(self.survey.Is_deleted)
#         self.assertFalse(self.survey.Is_released)
#         self.assertEqual(self.submission.Status, 'Deleted')

#     def test_update_released_survey_status(self):
#         # 测试更新问卷发布状态
#         data = {'flag': 2, 'id': 1}
#         response = self.client.post(self.url, json.dumps(data), content_type='application/json')
#         self.survey.refresh_from_db()
#         self.assertEqual(response.status_code, 200)
#         self.assertFalse(self.survey.Is_open)  # 撤回发布状态

#     def test_invalid_json_body(self):
#         # 测试提交的 JSON 数据无效
#         response = self.client.post(self.url, '{"bad_json": "}', content_type='application/json')
#         self.assertEqual(response.status_code, 400)
#         self.assertEqual(response.json()['error'], 'Invalid JSON body')

# class delete_filled_qs_test(TestCase):
#     def setUp(self):
#         # 创建测试用户和问卷及提交记录
#         self.user = User.objects.create(username='testuser', email='user@example.com', password='password123', zhibi=100)
#         self.survey = Survey.objects.create(Owner=self.user, Title="Survey", Is_released=True)
#         self.submission = Submission.objects.create(Survey=self.survey, Respondent=self.user, SubmissionID=1)
#         self.url = reverse('delete-filled-qs')

#     def test_delete_submission(self):
#         # 测试成功删除提交记录
#         data = 1
#         response = self.client.post(self.url, json.dumps(data), content_type='application/json')
#         self.assertEqual(response.status_code, 200)
#         self.assertEqual(response.json()['message'], "True")
#         self.assertFalse(Submission.objects.filter(SubmissionID=1).exists())  # 确认提交记录已被删除

#     def test_invalid_json_body(self):
#         # 测试提交的 JSON 数据无效
#         response = self.client.post(self.url, '{"bad_json": "}', content_type='application/json')
#         self.assertEqual(response.status_code, 400)
#         self.assertEqual(response.json()['error'], 'Invalid JSON body')