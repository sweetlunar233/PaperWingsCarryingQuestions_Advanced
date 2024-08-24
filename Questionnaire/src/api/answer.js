import { post,get } from "./api"

let userServeAddress='http://82.156.97.95:7000'
let managementServeAddress='http://82.156.97.95:7001'
let editionServeAddress='http://82.156.97.95:7002'

export function GetFillInTestAnswer(username, questionnaireId, submissionId) {
    return get(editionServeAddress+"/testAnswer/"+username+"/"+questionnaireId+"/"+submissionId+"/");
}

export function GetFillInNormalAnswer(username, questionnaireId, submissionId) {
    return get(editionServeAddress+"/normalAnswer/"+username+"/"+questionnaireId+"/"+submissionId+"/");
}