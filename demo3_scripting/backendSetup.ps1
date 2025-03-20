# Script to setup Azure Storage Account for Terraform Backend
param(
    [Parameter(Mandatory=$true)]
    [string]$resourceGroupName,
    
    [Parameter(Mandatory=$true)]
    [string]$storageAccountName,
    
    [Parameter(Mandatory=$false)]
    [string]$location = "eastus",
    
    [Parameter(Mandatory=$false)]
    [string]$containerName = "tfstate"
)

# Function to check if Azure PowerShell modules are installed
function Test-AzureModules {
    try {
        $module = Get-Module -Name Az -ListAvailable
        if ($null -eq $module) {
            Write-Error "Azure PowerShell modules are not installed. Please run 'Install-Module -Name Az' first."
            return $false
        }
        return $true
    }
    catch {
        Write-Error "Error checking Azure PowerShell modules: $_"
        return $false
    }
}

# Function to check if user is logged in to Azure
function Test-AzureLogin {
    try {
        $context = Get-AzContext
        if ($null -eq $context) {
            Write-Error "Not logged in to Azure. Please run 'Connect-AzAccount' first."
            return $false
        }
        return $true
    }
    catch {
        Write-Error "Error checking Azure login status: $_"
        return $false
    }
}

# Main script execution
if (-not (Test-AzureModules)) {
    exit 1
}

if (-not (Test-AzureLogin)) {
    exit 1
}

Write-Host "Creating Resource Group: $resourceGroupName"
try {
    New-AzResourceGroup -Name $resourceGroupName -Location $location -Force
}
catch {
    Write-Error "Failed to create resource group: $_"
    exit 1
}

Write-Host "Creating Storage Account: $storageAccountName"
try {
    $storageAccount = New-AzStorageAccount `
        -ResourceGroupName $resourceGroupName `
        -Name $storageAccountName `
        -Location $location `
        -SkuName Standard_LRS `
        -EnableHttpsTrafficOnly $true `
        -MinimumTlsVersion TLS1_2
}
catch {
    Write-Error "Failed to create storage account: $_"
    exit 1
}

Write-Host "Getting Storage Account Key"
try {
    $storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName)[0].Value
}
catch {
    Write-Error "Failed to get storage account key: $_"
    exit 1
}

Write-Host "Creating Blob Container: $containerName"
try {
    $storageContext = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey
    New-AzStorageContainer -Name $containerName -Context $storageContext -Permission Off
}
catch {
    Write-Error "Failed to create container: $_"
    exit 1
}

Write-Host "`nStorage Account setup completed successfully!"
Write-Host "Use the following values in your Terraform backend configuration:`n"
Write-Host "storage_account_name: $storageAccountName"
Write-Host "container_name: $containerName"
Write-Host "resource_group_name: $resourceGroupName"
Write-Host "access_key: $storageAccountKey"
