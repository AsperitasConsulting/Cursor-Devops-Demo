# Parameters
RESOURCE_GROUP_NAME=$1
STORAGE_ACCOUNT_NAME=$2
CONTAINER_NAME=${3:-tfstate}
LOCATION=${4:-eastus}

# Check if required parameters are provided
if [ -z "$RESOURCE_GROUP_NAME" ] || [ -z "$STORAGE_ACCOUNT_NAME" ]; then
  echo "Usage: $0 <resource-group-name> <storage-account-name> [container-name] [location]"
  exit 1
fi

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create storage account
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION --sku Standard_LRS

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

echo "Storage Account Name: $STORAGE_ACCOUNT_NAME"
echo "Container Name: $CONTAINER_NAME"

# Instructions for using this storage account as a Terraform backend
echo "To use this storage account as a Terraform backend, add the following to your Terraform configuration:"
echo "
terraform {
  backend \"azurerm\" {
    resource_group_name   = \"$RESOURCE_GROUP_NAME\"
    storage_account_name  = \"$STORAGE_ACCOUNT_NAME\"
    container_name        = \"$CONTAINER_NAME\"
    key                   = \"terraform.tfstate\"
  }
}
"
