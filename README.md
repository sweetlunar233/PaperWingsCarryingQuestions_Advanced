# 2024PaperPlant

## 启动后端之前要开放端口
允许网络流量通过（进入和出去）防火墙的 7000 端口
sudo ufw allow 7000

## 启动时注意加0.0.0.0
sudo python3 manage.py runserver 0.0.0.0:7000