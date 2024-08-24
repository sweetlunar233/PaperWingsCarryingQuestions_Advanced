import { post,get } from "./api"

let userServeAddress='http://127.0.0.1:7000'
let managementServeAddress='http://127.0.0.1:7001'
let editionServeAddress='http://127.0.0.1:7002'

export function GetFillInTestAnswer(username, questionnaireId, submissionId) {
    return get(editionServeAddress+"/testAnswer/"+username+"/"+questionnaireId+"/"+submissionId+"/");
}

export function GetFillInNormalAnswer(username, questionnaireId, submissionId) {
    return get(editionServeAddress+"/normalAnswer/"+username+"/"+questionnaireId+"/"+submissionId+"/");
}