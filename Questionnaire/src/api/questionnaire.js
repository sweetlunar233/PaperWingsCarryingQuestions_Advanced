import { post,get } from "./api"

let userServeAddress='http://127.0.0.1:8000'
let managementServeAddress='http://127.0.0.1:8001'
let editionServeAddress='http://127.0.0.1:8002'

export function GetUnreleasedQs(username){
    let data = {};
    data.username = username;
    return get("/Manage/unreleased/"+username+"/");
}

export function GetReleasedQs(username){
    let data = {};
    data.username = username;
    return get("/Manage/released/"+username+"/");
}

export function GetFilledQs(username){
    let data = {};
    data.username = username;
    return get(`${managementServeAddress}/Manage/filled/`+username+"/");
}

export function GetAllReleasedQs(){
    return get("/Manage/square/");
}

export function DeleteUnreleasedQs(id){
    let data = {};
    data.id = id;
    return post("/Manage/unreleased/", id);
}

export function DeleteFilledQs(id){
    let data = {};
    data.id = id;
    return post("/Manage/filled/", id);
}

//update:0
//delete:1
export function UpdateOrDelete(id, flag){
    let data = {};
    data.id = id;
    data.flag = flag;
    return post("/Manage/released/",data);
}

export function check(username, questionnaireId, type){
    return get("/Manage/square/"+username+"/"+questionnaireId+"/"+type);
}

export function checkFilled(questionnaireId){
    return get("/Manage/filled/"+questionnaireId);
}