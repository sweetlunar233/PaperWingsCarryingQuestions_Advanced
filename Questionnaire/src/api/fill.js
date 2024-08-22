import { post,get } from "./api"

let userServeAddress='http://172.0.0.1:8000'
let managementServeAddress='http://172.0.0.1:8001'
let editionServeAddress='http://172.0.0.1:8002'

export function getQuestionnaireFill(
    username,
    questionnaireId
){
    return get("/questionnaireFill/" + username + "/" + questionnaireId + "/");
}
