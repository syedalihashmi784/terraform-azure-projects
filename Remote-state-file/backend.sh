#!/bin/bash

# CONFIGURATION (edit if needed)


# Resource group for Terraform remote state
RESOURCE_GROUP_NAME="tfstate-rg-canada"

# Region allowed by your Student subscription
LOCATION="canadacentral"

# Storage account (must be globally unique + lowercase)
STORAGE_ACCOUNT_NAME="tfstatecanada$RANDOM"

# Terraform state container
CONTAINER_NAME="tfstate"


# CREATE RESOURCE GROUP

echo "➡️  Creating resource group: $RESOURCE_GROUP_NAME in $LOCATION ..."
az group create \
  --name "$RESOURCE_GROUP_NAME" \
  --location "$LOCATION"



# CREATE STORAGE ACCOUNT

echo "➡️  Creating storage account: $STORAGE_ACCOUNT_NAME in $LOCATION ..."
az storage account create \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --name "$STORAGE_ACCOUNT_NAME" \
  --sku Standard_LRS \
  --encryption-services blob \
  --location "$LOCATION"



# CREATE STORAGE CONTAINER

echo "  Creating blob container: $CONTAINER_NAME ..."
az storage container create \
  --name "$CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT_NAME" \
  --auth-mode login



# OUTPUT SUMMARY

echo ""
echo " Backend resources created successfully!"
echo "------------------------------------------"
echo "Resource Group:       $RESOURCE_GROUP_NAME"
echo "Storage Account:      $STORAGE_ACCOUNT_NAME"
echo "Container:            $CONTAINER_NAME"
echo ""
echo "Use these values in your Terraform backend block."
