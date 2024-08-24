const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  //82.156.97.95
  //  devServer: {
  //    proxy: {
  //     '/user': {
  //       target: 'http://127.0.0.1:8000', // Django服务器的地址
  //       changeOrigin: true,
  //       pathRewrite: {
  //       '^/user': ''
  //       }
  //     },
  //     '/management': {
  //       target: 'http://127.0.0.1:8001', // Django服务器的地址
  //       changeOrigin: true,
  //       pathRewrite: {
  //         '^/management': ''
  //       }
  //     },
  //     '/edition': {
  //       target: 'http://127.0.0.1:8002', // Django服务器的地址
  //       changeOrigin: true,
  //       pathRewrite: {
  //        '^/edition': ''
  //       }
  //     },
  //    },
  //  },
})