from django.test import TestCase
from django.urls import reverse
from .models import Submission
import json
from rest_framework.test import APIClient

# 如果使用这个测试，则会新建一个问卷，会影响观感，所以暂时取消
# class save_qs_design_test(TestCase):
#     def setUp(self):
#         self.url = reverse('save-qs-design-url')
#         self.questionList = [
#             {"type": 1, "question": "Choice question", "isNecessary": True, "score": 10, "optionCnt": 3, "max": 2, "optionList": [
#                 {"content": "Option 1", "isCorrect": True, "MaxSelectablePeople": 50},
#                 {"content": "Option 2", "isCorrect": False, "MaxSelectablePeople": 50}
#             ]},
#             {"type": 3, "question": "Blank question", "isNecessary": True, "score": 5, "correctAnswer": 1}
#         ]

#         self.survey_data = {
#             "surveyID": -1, "title": "New Survey", "category": 0, "isOrder": True, "timeLimit": 30, "userName": "lorian",
#             "description": "Test survey", "Is_released": False, "questionList": self.questionList
#         }

#     def test_create_new_survey(self):
#         # 测试创建新问卷
#         response = self.client.post(self.url, json.dumps(self.survey_data), content_type='application/json')
#         self.assertEqual(response.status_code, 200)

#     def test_invalid_request_method(self):
#         # 测试错误的请求方法
#         response = self.client.get(self.url)
#         self.assertEqual(response.status_code, 405)
#         self.assertEqual(response.json()['error'], 'Invalid request method')

class get_questionnaire_test(TestCase):
    def setUp(self):
        # 创建测试环境
        self.client = APIClient()
        self.url = reverse('get_questionnaire', args=[16])

    def test_get_questionnaire_success(self):
        # 测试成功获取问卷设计内容
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)

# 如果使用这个测试，则会新建一个提交记录，会影响观感，所以暂时取消
# class get_store_fill_test(TestCase):
#     def setUp(self):
#         # 创建测试环境
#         self.client = APIClient()
#         self.url =reverse('get-store-fill-url', kwargs={'userName': 'lorian', 'surveyID': 1, 'submissionID': -1})

#     def test_get_existing_submission(self):
#         # 测试获取现有的问卷填写记录
#         response = self.client.get(self.url)
#         self.assertEqual(response.status_code, 200)
#         response_data = response.json()  # 获取完整的响应数据
#         self.assertIn('Title', response_data)

#     def test_questionnaire_not_found(self):
#         # 测试问卷不存在的情况
#         url = reverse('get-store-fill-url', kwargs={'userName': 'lorian', 'surveyID': 9999, 'submissionID': 1})  # 不存在的 SurveyID
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 404)

# -----问卷展示界面-----

class display_answer_normal_test(TestCase):
    def setUp(self):
        # 设置测试环境
        self.client = APIClient()
        # 设置URL
        self.url = reverse('display-answer-normal', kwargs={'username': 'lorian', 'questionnaireId': 17, 'submissionId': 12})

    def test_display_answer_normal_success(self):
        # 测试成功展示问卷答案
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)

    def test_user_not_found(self):
        # 测试用户不存在的情况
        url = reverse('display-answer-normal', kwargs={'username': 'unknownuser', 'questionnaireId': 17, 'submissionId': 12})
        response = self.client.get(url)
        self.assertEqual(response.status_code, 500)

class display_answer_test_test(TestCase):
    def setUp(self):
        # 设置测试环境
        self.client = APIClient()
        # 设置URL
        self.url = reverse('display-answer-test', kwargs={'username': 'wly', 'questionnaireId': 16, 'submissionId': 9})

    def test_display_answer_test_success(self):
        # 测试成功展示考试问卷答案
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        response_data = response.json()
        self.assertIn('Title', response_data)

    def test_survey_not_found(self):
        # 测试问卷不存在的情况
        url = reverse('display-answer-test', kwargs={'username':'wly', 'questionnaireId': 9999, 'submissionId': 9})
        response = self.client.get(url)
        self.assertEqual(response.status_code, 404)
        self.assertIn('Questionnaire not found', response.content.decode())

# -----数据分析-----

class cross_analysis_test(TestCase):
    def setUp(self):
        # 设置测试环境
        self.client = APIClient()
        # 设置URL
        self.url = reverse('cross-analysis-url', kwargs={'QuestionID1': 33, 'QuestionID2': 34})

    def test_cross_analysis_success(self):
        # 测试交叉分析的成功情况
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        response_data = response.json()
        self.assertIn('crossCount', response_data)
        self.assertIn('crossText', response_data)

    def test_invalid_request_method(self):
        # 测试错误的请求方法
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 405)
        self.assertEqual(response.json()['error'], 'Invalid request method')

class survey_statistics_test(TestCase):
    def setUp(self):
        # 设置测试环境
        self.client = APIClient()
        # 设置URL
        self.url = reverse('survey-statistics-url', kwargs={'surveyID': 16})

    def test_survey_statistics_success(self):
        # 测试获取问卷统计数据的成功情况
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        response_data = response.json()
        self.assertIn('title', response_data)

    def test_survey_not_found(self):
        # 测试问卷不存在的情况
        url = reverse('survey-statistics-url', kwargs={'surveyID': 999})
        response = self.client.get(url)
        self.assertEqual(response.status_code, 404)
        self.assertIn('Survey not found', response.content.decode())

class download_submissions_test(TestCase):
    def setUp(self):
        # 设置测试环境
        self.client = APIClient()
        # 设置URL
        self.url = reverse('download_submissions-url', kwargs={'surveyID': 16})

    def test_download_submissions_success(self):
        # 测试成功下载提交记录
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response['Content-Type'], 'application/vnd.ms-excel')

    def test_no_submissions(self):
        # 测试无提交记录的情况
        Submission.objects.all().delete()
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 404)
        self.assertIn('No submission records available.', response.content.decode())


# ----- -----

class check_survey_status_test(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.url = reverse('check_survey_status', kwargs={'survey_id': 16})

    def test_check_survey_status(self):
        response = self.client.post(self.url)
        self.assertEqual(response.status_code, 200)
        response_data = response.json()  # 获取完整的响应数据
        self.assertIn('is_full', response_data)