# echo "Logging in to Azure..."
# # az login --allow-no-subscriptions

echo "Setting the subscription to 'Azure for Students'"
az account set --subscription "Azure for Students"

echo "Logging in to Azure Container Registry..."
az acr login --name demoregistryrg

echo "Building the Docker image 'demonode'"
docker build -t demonode .

echo "Tagging the Docker image 'demoregistryrg-cka6c0befea3fqf9.azurecr.io/demonode'"
docker tag demonode demoregistryrg-cka6c0befea3fqf9.azurecr.io/demonode

echo "Pushing the Docker image to Azure Container Registry 'demoregistryrg-cka6c0befea3fqf9.azurecr.io/demonode'"
docker push demoregistryrg-cka6c0befea3fqf9.azurecr.io/demonode

echo "Restarting the Azure Web App 'demonode'"
az webapp restart --name demo-node --resource-group DemoRegistryRG

echo "Deployment complete for dev!"