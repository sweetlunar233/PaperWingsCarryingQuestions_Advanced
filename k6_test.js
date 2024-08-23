import http from 'k6/http';
import { check,sleep } from 'k6';

// export let options = {
//     vus: 50, // 设置并发用户个数
//     duration: '1m', // 持续运行1分钟
// };

export let options = {
    stages: [
        { duration: '10s', target: 20 }, // 10秒内增加到10个并发用户
        { duration: '20s', target: 30 }, // 持续20秒保持20个并发用户
        { duration: '20s', target: 40 }, // 20秒内增加到30个并发用户
        { duration: '10s', target: 0 },  // 10秒内将并发用户数降为0
    ],
};


export default function () {
    let res = http.get('http://localhost:8081/questionnaireDesign/1/'); // 替换为你的API地址
    check(res, {
        'status is 200': (r) => r.status === 200,
    });
    // sleep(1); // 每个用户请求之间等待1秒
}
