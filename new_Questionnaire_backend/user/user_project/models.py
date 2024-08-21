from django.db import models
import json

# Create your models here.
class User(models.Model):
    UserID = models.AutoField(primary_key=True)
    username = models.CharField(unique=True, max_length=50)
    password = models.CharField(max_length=255)
    email = models.EmailField(unique=True, max_length=100)
    CreateDate = models.DateTimeField(auto_now_add=True)
    isActive=models.BooleanField(default=False)
    zhibi=models.IntegerField(default=0)
    own_photos=models.TextField(default=json.dumps([0] * 18))

    def set_array_element(self, index, value):
        # 确保索引在有效范围内  
        if 0 <= index < 18:  
            photos_data = json.loads(self.own_photos)  
            photos_data[index] = value  
            self.own_photos = json.dumps(photos_data)  
            self.save()  
    
    def get_array_element(self, index):  
        # 确保索引在有效范围内  
        if 0 <= index < 18:  
            photos_data = json.loads(self.own_photos)  
            return photos_data[index]  
        return -1
    
    #获取当前正在使用的头像编号(默认为0，1是已购买，2是正在使用)
    def get_used_element(self):
        photos_data = json.loads(self.own_photos)
        for i in range(0,18):
            if(photos_data[i]==2): return i
        return -1