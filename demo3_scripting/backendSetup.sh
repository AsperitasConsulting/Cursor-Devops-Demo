#!/bin/bash

# Exit if any command fails
set -e

# Function to display usage
usage() {
    echo "Usage: $0 -r RESOURCE_GROUP_NAME -s STORAGE_ACCOUNT_NAME [-c CONTAINER_NAME] [-l LOCATION]"
    echo
    echo "Required arguments:"
    echo "  -r    Resource group name"
    echo "  -s    Storage account name"
    echo
    echo "Optional arguments:"
    echo "  -c    Container name (default: tfstate)"
    echo "  -l    Location (default: eastus)"
    echo "  -h    Show this help message"
    exit 1
}

# Default values
CONTAINER_NAME="tfstate"
LOCATION="eastus"

# Parse command line arguments
while getopts "r:s:c:l:h" opt; do
    case $opt in
        r)
            RESOURCE_GROUP_NAME="$OPTARG"
            ;;
        s)
            STORAGE_ACCOUNT_NAME="$OPTARG"
            ;;
        c)
            CONTAINER_NAME="$OPTARG"
            ;;
        l)
            LOCATION="$OPTARG"
            ;;
        h)
            usage
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
    esac
done

# Check if required arguments are provided
if [ -z "$RESOURCE_GROUP_NAME" ] || [ -z "$STORAGE_ACCOUNT_NAME" ]; then
    echo "Error: Resource group name and storage account name are required"
    usage
fi

# Create resource group
echo "Creating resource group..."
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create storage account
echo "Creating storage account..."
az storage account create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $STORAGE_ACCOUNT_NAME \
    --sku Standard_LRS \
    --encryption-services blob

# Get storage account key
echo "Retrieving storage account key..."
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

# Create blob container
echo "Creating blob container..."
az storage container create \
    --name $CONTAINER_NAME \
    --account-name $STORAGE_ACCOUNT_NAME \
    --account-key $ACCOUNT_KEY

echo "Storage account created successfully!"
echo "Use the following Terraform backend configuration:"
echo "----------------"
echo "backend \"azurerm\" {"
echo "  resource_group_name  = \"$RESOURCE_GROUP_NAME\""
echo "  storage_account_name = \"$STORAGE_ACCOUNT_NAME\""
echo "  container_name      = \"$CONTAINER_NAME\""
echo "  key                 = \"terraform.tfstate\""
echo "}"
echo "----------------"

# Save the configuration to a file
echo "Saving configuration to backend.conf..."
cat > backend.conf << EOF
storage_account_name = "$STORAGE_ACCOUNT_NAME"
container_name = "$CONTAINER_NAME"
key = "terraform.tfstate"
resource_group_name = "$RESOURCE_GROUP_NAME"
EOF

echo "Configuration saved to backend.conf"
