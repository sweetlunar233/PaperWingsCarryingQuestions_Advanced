import { post,get } from "./api"

let userServeAddress='http://82.156.88.4:31000'
let managementServeAddress='http://82.156.88.4:31001'
let editionServeAddress='http://82.156.88.4:31002'

export function getQuestionnaireFill(
    username,
    questionnaireId
){
    return get(editionServeAddress+"/questionnaireFill/" + username + "/" + questionnaireId + "/");
}
