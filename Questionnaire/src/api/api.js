import axios from "axios";

//const serveAddress = "http://8.140.247.134:8001";
const serveAddress = "http://82.156.88.4:8000";

export function post(url,data){
    return new Promise((resolve,reject) => {
        axios
            .post(url,data)
            .then((response) => {
                // 存储令牌到localStorage或sessionStorage  
                localStorage.setItem('access_token', response.data.access_token); 
                resolve(response.data);
            })
            .catch((error) => {
                // 错误处理
            })
    });
}

export function get(url,param){
    return new Promise((resolve,reject) => {
        axios
            .get(url,{
                headers: {  
                    'Authorization': `Bearer ${localStorage.getItem('access_token')}`  
                },
                params:param
            })
            .then((response) => {
                resolve(response.data);
            })
            .catch((error) => {
                // 错误处理
            })
    });
}