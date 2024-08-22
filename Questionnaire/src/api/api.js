import axios from "axios";

let userServeAddress='http://172.0.0.1:8000'
let managementServeAddress='http://172.0.0.1:8001'
let editionServeAddress='http://172.0.0.1:8002'

//const serveAddress = "http://8.140.247.134:8001";
const serveAddress = "http://127.0.0.1:8000";

export function post(url,data){
    return new Promise((resolve,reject) => {
        axios
            .post(url,data)
            .then((response) => {
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