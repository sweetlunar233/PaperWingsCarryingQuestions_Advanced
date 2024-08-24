import { post,get } from "./api"

let userServeAddress='http://127.0.0.1:7000'
let managementServeAddress='http://127.0.0.1:7001'
let editionServeAddress='http://127.0.0.1:7002'

export function getQuestionnaireFill(
    username,
    questionnaireId
){
    return get(editionServeAddress+"/questionnaireFill/" + username + "/" + questionnaireId + "/");
}
