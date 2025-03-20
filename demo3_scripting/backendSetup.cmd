@echo off
setlocal EnableDelayedExpansion

:: Default values
set "CONTAINER_NAME=tfstate"
set "LOCATION=eastus"

:: Function to display usage
:usage
echo Usage: %0 -r RESOURCE_GROUP_NAME -s STORAGE_ACCOUNT_NAME [-c CONTAINER_NAME] [-l LOCATION]
echo.
echo Required arguments:
echo   -r    Resource group name
echo   -s    Storage account name
echo.
echo Optional arguments:
echo   -c    Container name (default: tfstate)
echo   -l    Location (default: eastus)
echo   -h    Show this help message
exit /b 1

:: Parse command line arguments
:parse_args
if "%~1"=="" goto check_required
if "%~1"=="-h" goto usage
if "%~1"=="-r" (
    set "RESOURCE_GROUP_NAME=%~2"
    shift
    shift
    goto parse_args
)
if "%~1"=="-s" (
    set "STORAGE_ACCOUNT_NAME=%~2"
    shift
    shift
    goto parse_args
)
if "%~1"=="-c" (
    set "CONTAINER_NAME=%~2"
    shift
    shift
    goto parse_args
)
if "%~1"=="-l" (
    set "LOCATION=%~2"
    shift
    shift
    goto parse_args
)
echo Invalid option: %~1
goto usage

:check_required
if not defined RESOURCE_GROUP_NAME (
    echo Error: Resource group name is required
    goto usage
)
if not defined STORAGE_ACCOUNT_NAME (
    echo Error: Storage account name is required
    goto usage
)

:: Create resource group
echo Creating resource group...
call az group create --name %RESOURCE_GROUP_NAME% --location %LOCATION%
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

:: Create storage account
echo Creating storage account...
call az storage account create ^
    --resource-group %RESOURCE_GROUP_NAME% ^
    --name %STORAGE_ACCOUNT_NAME% ^
    --sku Standard_LRS ^
    --encryption-services blob
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

:: Get storage account key
echo Retrieving storage account key...
for /f "tokens=* usebackq" %%a in (`az storage account keys list --resource-group %RESOURCE_GROUP_NAME% --account-name %STORAGE_ACCOUNT_NAME% --query "[0].value" -o tsv`) do (
    set "ACCOUNT_KEY=%%a"
)

:: Create blob container
echo Creating blob container...
call az storage container create ^
    --name %CONTAINER_NAME% ^
    --account-name %STORAGE_ACCOUNT_NAME% ^
    --account-key %ACCOUNT_KEY%
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo Storage account created successfully!
echo Use the following Terraform backend configuration:
echo ----------------
echo backend "azurerm" {
echo   resource_group_name  = "%RESOURCE_GROUP_NAME%"
echo   storage_account_name = "%STORAGE_ACCOUNT_NAME%"
echo   container_name      = "%CONTAINER_NAME%"
echo   key                 = "terraform.tfstate"
echo }
echo ----------------

:: Save the configuration to a file
echo Saving configuration to backend.conf...
(
echo storage_account_name = "%STORAGE_ACCOUNT_NAME%"
echo container_name = "%CONTAINER_NAME%"
echo key = "terraform.tfstate"
echo resource_group_name = "%RESOURCE_GROUP_NAME%"
) > backend.conf

echo Configuration saved to backend.conf

endlocal
