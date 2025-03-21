@echo off
setlocal

REM Check for required parameters
if "%~1"=="" (
    echo Usage: %~nx0 RESOURCE_GROUP_NAME STORAGE_ACCOUNT_NAME [CONTAINER_NAME] [LOCATION]
    exit /b 1
)

REM Set variables from parameters
set RESOURCE_GROUP_NAME=%~1
set STORAGE_ACCOUNT_NAME=%~2
set CONTAINER_NAME=%~3
if "%CONTAINER_NAME%"=="" set CONTAINER_NAME=tfstate
set LOCATION=%~4
if "%LOCATION%"=="" set LOCATION=eastus

REM Login to Azure
az login

REM Create resource group
az group create --name %RESOURCE_GROUP_NAME% --location %LOCATION%

REM Create storage account
az storage account create --name %STORAGE_ACCOUNT_NAME% --resource-group %RESOURCE_GROUP_NAME% --location %LOCATION% --sku Standard_LRS

REM Create blob container
az storage container create --name %CONTAINER_NAME% --account-name %STORAGE_ACCOUNT_NAME%

echo Storage Account Name: %STORAGE_ACCOUNT_NAME%
echo Container Name: %CONTAINER_NAME%

REM Instructions for using the storage account as a Terraform backend
echo.
echo To use this storage account as a Terraform backend, add the following configuration to your Terraform configuration file:
echo.
echo terraform {
echo ^  backend "azurerm" {
echo ^    resource_group_name   = "%RESOURCE_GROUP_NAME%"
echo ^    storage_account_name  = "%STORAGE_ACCOUNT_NAME%"
echo ^    container_name        = "%CONTAINER_NAME%"
echo ^    key                   = "terraform.tfstate"
echo ^  }
echo }
echo.

endlocal
