$RG="LunaRG"
$ACA_ENVIRONMENT="luna-aca-env"
$ACA_NAME="luna-aca"

az group create -n $RG -l northeurope -o table
az containerapp env create -n $ACA_ENVIRONMENT -g $RG -l northeurope -o table

$ACA_ENVIRONMENT_ID=$(az containerapp env show -n $ACA_ENVIRONMENT -g $RG --query id -o tsv)
echo $ACA_ENVIRONMENT_ID

az containerapp create -n $ACA_NAME -g $RG --yaml aca-app.yaml
# az containerapp update --name luna-containerapp --resource-group luna-containerapps --yaml container-app.yaml
# az containerapp update --name luna-containerapp --resource-group luna-containerapps --yaml .\aca-app.yaml
# az containerapp update -n $ACA_NAME -g $RG --yaml aca-app.yaml