param (
    [Parameter(Mandatory=$true)]
    [string]$resourceGroupName,

    [Parameter(Mandatory=$true)]
    [string]$storageAccountName,

    [string]$containerName = "tfstate",
    [string]$location = "eastus"
)

# Login to Azure
Connect-AzAccount

# Create Resource Group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create Storage Account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -Location $location -SkuName Standard_LRS

# Get Storage Account Key
$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName)[0].Value

# Create Blob Container
$context = $storageAccount.Context
New-AzStorageContainer -Name $containerName -Context $context

Write-Output "Storage Account Name: $storageAccountName"
Write-Output "Container Name: $containerName"
Write-Output "Resource Group Name: $resourceGroupName"
Write-Output "Location: $location"

# Instructions for using the storage account as a Terraform backend
Write-Output "`nTo use this storage account as a Terraform backend, add the following configuration to your Terraform configuration file:"
Write-Output "`nterraform {"
Write-Output "  backend \"azurerm\" {"
Write-Output "    resource_group_name   = \"$resourceGroupName\""
Write-Output "    storage_account_name  = \"$storageAccountName\""
Write-Output "    container_name        = \"$containerName\""
Write-Output "    key                   = \"terraform.tfstate\""
Write-Output "  }"
Write-Output "}"
