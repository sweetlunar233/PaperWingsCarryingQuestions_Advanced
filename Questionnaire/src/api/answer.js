import { post,get } from "./api"

let userServeAddress='http://172.0.0.1:8000'
let managementServeAddress='http://172.0.0.1:8001'
let editionServeAddress='http://172.0.0.1:8002'

export function GetFillInTestAnswer(username, questionnaireId, submissionId) {
    return get("/edition/testAnswer/"+username+"/"+questionnaireId+"/"+submissionId+"/");
}

export function GetFillInNormalAnswer(username, questionnaireId, submissionId) {
    return get("/edition/normalAnswer/"+username+"/"+questionnaireId+"/"+submissionId+"/");
}