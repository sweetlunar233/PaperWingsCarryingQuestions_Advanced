import { post,get } from "./api"

let userServeAddress='http://82.156.88.4:31000'
let managementServeAddress='http://82.156.88.4:31001'
let editionServeAddress='http://82.156.88.4:31002'

export function GetFillInTestAnswer(username, questionnaireId, submissionId) {
    return get(editionServeAddress+"/testAnswer/"+username+"/"+questionnaireId+"/"+submissionId+"/");
}

export function GetFillInNormalAnswer(username, questionnaireId, submissionId) {
    return get(editionServeAddress+"/normalAnswer/"+username+"/"+questionnaireId+"/"+submissionId+"/");
}