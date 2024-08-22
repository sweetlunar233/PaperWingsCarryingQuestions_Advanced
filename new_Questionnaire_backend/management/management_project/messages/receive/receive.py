import pika

# 连接服务器
connection = pika.BlockingConnection(pika.ConnectionParameters('http://127.0.0.1:8000'))   
channel = connection.channel()

channel.queue_declare(queue='hello')

# 声明一个队列，如果队列不存在则创建  
channel.queue_declare(queue='hello')  
  
# 向队列发送消息  
channel.basic_publish(exchange='',  
                      routing_key='hello',  
                      body='Hello World!')  
print(" [x] Sent 'Hello World!'")  
  
# 关闭连接  
connection.close()