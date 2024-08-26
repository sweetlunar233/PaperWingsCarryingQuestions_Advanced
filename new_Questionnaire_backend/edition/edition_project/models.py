from django.db import models

# Create your models here.

class BaseQuestion(models.Model):
    QuestionID = models.AutoField(primary_key=True)
    SurveyID = models.IntegerField(blank=False)
    Text = models.TextField(max_length=500)
    IsRequired = models.BooleanField(default=True)
    QuestionNumber = models.IntegerField(default=0)
    Score = models.IntegerField(null=True, blank=True,default=0)
    Category=models.IntegerField()    #题目类型：单选为1；多选为2；填空题为3；评分题为4

    class Meta:
        abstract = True

class BlankQuestion(BaseQuestion):
    CorrectAnswer=models.TextField(max_length=100,null=True)

class ChoiceQuestion(BaseQuestion):
    MaxSelectable = models.IntegerField(default=1,null=True)    #多选题的最多可选项
    OptionCnt=models.IntegerField(default=0)

class ChoiceOption(models.Model):
    OptionID = models.AutoField(primary_key=True)
    Question = models.ForeignKey(ChoiceQuestion, on_delete=models.CASCADE, related_name='choice_options')
    Text = models.CharField(max_length=200)
    IsCorrect = models.BooleanField(default=False,null=True)
    OptionNumber=models.IntegerField(null=False,default=0)

    #报名问卷：每个选项的剩余人数(-1代表无人数限制)
    MaxSelectablePeople=models.IntegerField(null=False,default=-1)
    
class OtherOption(models.Model):
    IsRequired = models.BooleanField(default=True)
    Text = models.TextField(max_length=500)

class RatingQuestion(BaseQuestion):
    MinRating = models.IntegerField(default=1,null=True)
    MinText = models.TextField(max_length=500,null=True)
    MaxRating = models.IntegerField(default=5,null=True)
    MaxText = models.TextField(max_length=500,null=True)
    

class Answer(models.Model):
    AnswerID = models.AutoField(primary_key=True)
    Submission = models.ForeignKey('Submission', on_delete=models.CASCADE, related_name='%(class)s_answers')

    class Meta:
        abstract = True

class BlankAnswer(Answer):
    Question = models.ForeignKey(BlankQuestion, on_delete=models.CASCADE)
    Content = models.TextField(max_length=500)

class ChoiceAnswer(Answer):
    Question = models.ForeignKey(ChoiceQuestion, on_delete=models.CASCADE)
    ChoiceOptions = models.ForeignKey(ChoiceOption, on_delete=models.CASCADE)

class RatingAnswer(Answer):
    Question = models.ForeignKey(RatingQuestion, on_delete=models.CASCADE)
    Rate = models.IntegerField(null=True, blank=True)

class Submission(models.Model):
    SubmissionID = models.AutoField(primary_key=True)
    SurveyID = models.IntegerField(blank=False)
    RespondentID = models.IntegerField(blank=False)
    SubmissionTime = models.DateTimeField(null=True)
    Status = models.CharField(max_length=20, choices=[('Unsubmitted', 'Unsubmitted'), ('Submitted', 'Submitted'), ('Graded', 'Graded'),('Deleted','Deleted')])
    Score = models.IntegerField(null=True, blank=True)
    #Duration = models.IntegerField(null=True, blank=True)
    Interval=models.IntegerField(null=True, blank=True)
