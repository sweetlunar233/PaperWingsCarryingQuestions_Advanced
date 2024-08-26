import { post,get } from "./api"

let userServeAddress='http://81.70.184.96:7000'
let managementServeAddress='http://81.70.184.96:7001'
let editionServeAddress='http://81.70.184.96:7002'

export function GetFillInTestAnswer(username, questionnaireId, submissionId) {
    return get(editionServeAddress+"/testAnswer/"+username+"/"+questionnaireId+"/"+submissionId+"/");
}

export function GetFillInNormalAnswer(username, questionnaireId, submissionId) {
    return get(editionServeAddress+"/normalAnswer/"+username+"/"+questionnaireId+"/"+submissionId+"/");
}