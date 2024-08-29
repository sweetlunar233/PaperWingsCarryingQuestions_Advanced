import http from 'k6/http';
import { check,sleep } from 'k6';

// export let options = {
//     vus: 50, // 设置并发用户个数
//     duration: '1m', // 持续运行1分钟
// };

export let options = {
    stages: [
        { duration: '1m', target: 200 }, // 逐渐增加至100个用户
        { duration: '1m', target: 200 }, // 保持100个用户5分钟
        { duration: '1m', target: 0 },   // 逐渐减少至0个用户
    ],
};

export default function () {
    const url = 'http://82.156.88.4:31002/dataPre/7/';

    const response = http.get(url);

    check(response, {
        'status is 200': (r) => r.status === 200,
    });

    sleep(1);
}
