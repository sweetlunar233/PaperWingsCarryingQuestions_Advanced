# 使用 NGINX 官方镜像作为基础镜像
FROM nginx:latest

# 将构建的静态文件复制到 NGINX 默认的服务目录
COPY . /usr/share/nginx/html

# 暴露容器的80端口
EXPOSE 80
