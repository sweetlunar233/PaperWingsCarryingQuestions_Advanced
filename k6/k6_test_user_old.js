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
    const url = 'http://127.0.0.1:8000/personal/login/';
    const payload = JSON.stringify({
        username: 'lorian',
        email: false,
        password: 'lorian'
    });

    const params = {
        headers: {
            'Content-Type': 'application/json',
        },
    };

    const response = http.post(url, payload, params);

    check(response, {
        'is status 200': (r) => r.status === 200,
    });

    sleep(1);
}
