import { post,get } from "./api"

let userServeAddress='http://81.70.184.96:7000'
let managementServeAddress='http://81.70.184.96:7001'
let editionServeAddress='http://81.70.184.96:7002'

export function getQuestionnaireFill(
    username,
    questionnaireId
){
    return get(editionServeAddress+"/questionnaireFill/" + username + "/" + questionnaireId + "/");
}
