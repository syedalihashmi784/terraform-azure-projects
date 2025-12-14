#!/bin/bash

RESOURCE_GROUP_NAME=tfstate-vm-rg       #to be unique within your Azure subscription.
STORAGE_ACCOUNT_NAME=tfstatevm$RANDOM   #must be globally unique + lowercase
CONTAINER_NAME=tfstate-vm               #unique within the storage account, not globally unique
# Region allowed by your Student subscription
LOCATION="canadacentral"

# Create resource group
az group create \
    --name $RESOURCE_GROUP_NAME \
    --location $LOCATION

# Create storage account
az storage account create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $STORAGE_ACCOUNT_NAME \
    --sku Standard_LRS \
    --encryption-services blob \
    --location $LOCATION

# Create blob container
az storage container create \
    --name $CONTAINER_NAME \
    --account-name $STORAGE_ACCOUNT_NAME \
    --auth-mode login

echo " Backend resources created successfully!"