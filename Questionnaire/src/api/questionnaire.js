import { post,get } from "./api"

let userServeAddress='http://172.0.0.1:8000'
let managementServeAddress='http://172.0.0.1:8001'
let editionServeAddress='http://172.0.0.1:8002'

export function GetUnreleasedQs(username){
    let data = {};
    data.username = username;
    return get("/management/userManage/unreleased/"+username+"/");
}

export function GetReleasedQs(username){
    let data = {};
    data.username = username;
    return get("/management/userManage/released/"+username+"/");
}

export function GetFilledQs(username){
    let data = {};
    data.username = username;
    return get("/management/userManage/filled/"+username+"/");
}

export function GetAllReleasedQs(){
    return get("/management/userManage/square/");
}

export function DeleteUnreleasedQs(id){
    let data = {};
    data.id = id;
    return post("/management/userManage/unreleased/", id);
}

export function DeleteFilledQs(id){
    let data = {};
    data.id = id;
    return post("/management/userManage/filled/", id);
}

//update:0
//delete:1
export function UpdateOrDelete(id, flag){
    let data = {};
    data.id = id;
    data.flag = flag;
    return post("/management/userManage/released/",data);
}

export function check(username, questionnaireId, type){
    return get("/management/userManage/square/"+username+"/"+questionnaireId+"/"+type);
}

export function checkFilled(questionnaireId){
    return get("/management/userManage/filled/"+questionnaireId);
}