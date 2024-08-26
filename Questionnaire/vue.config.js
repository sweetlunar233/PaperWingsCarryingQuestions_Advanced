const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  //127.0.0.1
  //  devServer: {
  //    proxy: {
  //     '/personal/login': {
  //       target: 'http://81.70.184.96:7000', // Django服务器的地址
  //       changeOrigin: true,
  //       pathRewrite: {
  //       '^/personal': ''
  //       }
  //     },
      // '/management': {
      //   target: 'http://127.0.0.1:8001', // Django服务器的地址
      //   changeOrigin: true,
      //   pathRewrite: {
      //     '^/management': ''
      //   }
      // },
      // '/edition': {
      //   target: 'http://127.0.0.1:8002', // Django服务器的地址
      //   changeOrigin: true,
      //   pathRewrite: {
      //    '^/edition': ''
      //   }
      // },
    //  },
  //  },
})