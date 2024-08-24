# test

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

### 如何在服务器上部署？
1. 首先请在本地使用 npm run build。
2. 将 tiezhu-dockerfile 中的 Dockerfile 放到 dist 文件夹（dist 文件夹是git忽略的，并不会上传到github，请放心）
3. 进入到 dist 文件夹，使用命令 `docker build -t questionnaire-app .`构建镜像
4. 为镜像打上标签：`docker tag questionnaire-app tiezhugiegie/questionnaire-app`
5. `docker push tiezhugiegie/questionnaire-app`(这一步记得要开vpn)等待所有的镜像被推送到远端。请检查是否成功推送。若成功，一定不会有EOF报错
6. 回到云端服务器，运行命令 `sudo kubectl apply -f ~/test/deployment.yml`
7. 通过 `http://<服务器ip>:31234` 即可访问网页