# node-sample

# run docker image

docker run --rm -p 3000:3000 demonode

# docker deploy

```bash
az login --allow-no-subscriptions
az account set --subscription "Azure for Students"
az acr login --name demoregistryrg

docker build -t demonode .

docker tag demonode demoregistryrg-cka6c0befea3fqf9.azurecr.io/demonode
docker push demoregistryrg-cka6c0befea3fqf9.azurecr.io/demonode

az webapp restart --name demo-node --resource-group DemoRegistryRG
```