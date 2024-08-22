import { post,get } from "./api"

// export function getUserMessage(username){
//     let data = {};
//     data.username = username;
//     return get("/login",data);
// }
let userServeAddress='http://127.0.0.1:8000'
let managementServeAddress='http://127.0.0.1:8001'
let editionServeAddress='http://127.0.0.1:8002'

export function postUserMessage(username,password, email){
    console.log("i m in in")
    let data = {};
    data.username = username;
    data.password = password;
    data.email = email;
    return post(`${userServeAddress}/personal/login/`,data);
}

export function modifyUserInfoInMessage(username, email, password, photonumber, status, flag){
    let data = {};
    data.username = username;
    data.email = email;
    data.password = password;
    data.photonumber = photonumber;
    data.status = status;
    data.flag = flag;
    return post("/personal/message/", data);
}

// export function updateUserphotoInMassage(username, photonumber, status){
//     let data = {};
//     data.username = username;
//     data.photonumber = photonumber;
//     data.status = status;
//     return post("/personal/message", data);
// }

export function updateUserphotoInShop(username, photonumber, status, money){
    let data = {};
    data.username = username;
    data.photonumber = photonumber;
    data.status = status;
    data.money = money;
    return post("/personal/shop/", data);
}

// export function updateUserInfo(username, email){
//     let data = {};
//     data.username = username;
//     data.email = email;
//     return post("/userManage/personal",data);
// }

// export function updateUserPassword(username, password){
//     let data = {};
//     data.username = username;
//     data.password = password;
//     return post("/userManage/personal",data);
// }