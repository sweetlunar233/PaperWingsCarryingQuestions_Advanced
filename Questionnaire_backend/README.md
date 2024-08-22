# Questionnaire_backend
## 安装包和依赖项
(The following commands should be executed under the root directory)
```
pip install -r requirements.txt
```

## 服务器和数据库
服务器：
公网地址：49.232.201.229
内网地址：10.0.16.13
登录用户：ubuntu
密码：BUaa21374125

数据库：
外部地址：bj-cynosdbmysql-grp-g9kxigho.sql.tencentcdb.com:23531
内部地址：172.21.0.7:3306
用户3：buaa21374125
密码：BUaa21374125

## 数据库迁移
修改`models.py`后，在`backend`下执行：
```
python manage.py makemigrations user
python manage.py migrate user
```

## 关闭占用当前端口的进程
找到端口`8000`对应的进程号(PID):
```
sudo lsof -i :8000
```
kill进程：
```
kill [PID]
```

## 安装Nginx

1. 从 [Nginx官网](http://nginx.org/en/download.html) 下载适用于Windows的稳定版。
2. 解压下载的文件到 `C:\nginx` 或 `D:\nginx`

## Nginx 配置

1. 打开 nginx.conf:
通常位于 C:\nginx\conf\nginx.conf（Windows），使用文本编辑器打开这个文件
2. 在 http 块中添加一行 include 指令，引用你项目中的配置文件：
```
http {
    include       mime.types;
    default_type  application/octet-stream;

    # 引用项目内的Nginx配置文件
    include C:/path/to/your/project/nginx.conf;

    # 其他配置...
}
```
3. 打开命令提示符，导航到 `C:\nginx` 或 `D:\nginx` 目录，运行 `start nginx` 启动Nginx。
4. 管理Nginx:
   - 停止Nginx：要停止Nginx，可以在命令提示符中输入以下命令：
    ```
    nginx -s stop
    ```
    - 重新加载配置：如果你修改了Nginx的配置文件并希望应用更改，而无需完全停止Nginx，可以使用以下命令重新加载配置：
    ```
    nginx -s reload
    ```
5. 使用下面的代码，启动Django实例：
    ```
    python manage.py runserver 8000
    python manage.py runserver 8001
    python manage.py runserver 8002
    ```
    如果暂时不需要负载均衡，可以只启动任一一个
6. 访问 `http://127.0.0.1:8000/` 或 `http://127.0.0.1:8001/` 或 `http://127.0.0.1:8002/` 验证Nginx是否启动成功（请根据启动的端口号，选择网址）