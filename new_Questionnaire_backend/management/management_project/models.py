from django.db import models

# Create your models here.
class Survey(models.Model):
    SurveyID = models.AutoField(primary_key=True)
    OwnerID = models.IntegerField(unique=True)
    Title = models.CharField(max_length=200)
    Description = models.TextField(max_length=500, blank=True)
    Is_released = models.BooleanField(blank=True)
    Is_open = models.BooleanField(default=True)
    Is_deleted=models.BooleanField(default=False)
    #新加的（把日期变为字符串）
    PublishDate = models.DateTimeField(null=True)
    #0 是普通问卷，1是投票问卷，2是报名问卷，3是考试问卷
    Category = models.IntegerField(default=0)   
    TotalScore = models.IntegerField(null=True, blank=True)
    TimeLimit = models.IntegerField(null=True, blank=True)
    IsOrder = models.BooleanField(default=True)
    #QuotaLimit = models.IntegerField(null=True, default=False)

class Submission(models.Model):
    SubmissionID = models.AutoField(primary_key=True)
    SurveyID = models.IntegerField(unique=True)
    RespondentID = models.IntegerField(unique=True)
    SubmissionTime = models.DateTimeField(auto_now_add=True)
    Status = models.CharField(max_length=20, choices=[('Unsubmitted', 'Unsubmitted'), ('Submitted', 'Submitted'), ('Graded', 'Graded'),('Deleted','Deleted')])
    Score = models.IntegerField(null=True, blank=True)
    #Duration = models.IntegerField(null=True, blank=True)
    Interval=models.IntegerField(null=True, blank=True)

class RewardOffering(models.Model):
    RewardID = models.AutoField(primary_key=True)
    Survey = models.ForeignKey(Survey, on_delete=models.CASCADE, related_name='rewards')
    Description = models.TextField()
    Zhibi = models.IntegerField()
    AvailableQuota = models.IntegerField()