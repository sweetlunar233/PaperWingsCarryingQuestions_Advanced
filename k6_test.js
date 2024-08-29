import http from 'k6/http';
import { check,sleep } from 'k6';

// export let options = {
//     vus: 50, // 设置并发用户个数
//     duration: '1m', // 持续运行1分钟
// };

import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
    stages: [
        { duration: '2m', target: 100 }, // 逐渐增加至100个用户
        { duration: '5m', target: 100 }, // 保持100个用户5分钟
        { duration: '2m', target: 0 },   // 逐渐减少至0个用户
    ],
};

export default function () {
    const url = 'http://82.156.88.4/personal/login/';
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
