const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
   devServer: {
     proxy: {
      '/user': {
        target: 'http://localhost:8000', // Django服务器的地址
        changeOrigin: true,
        pathRewrite: {
        '^/user': ''
        }
      },
      '/management': {
        target: 'http://localhost:8001', // Django服务器的地址
        changeOrigin: true,
        pathRewrite: {
          '^/management': ''
        }
      },
      '/edition': {
        target: 'http://localhost:8002', // Django服务器的地址
        changeOrigin: true,
        pathRewrite: {
         '^/edition': ''
        }
      },
     },
   },
})