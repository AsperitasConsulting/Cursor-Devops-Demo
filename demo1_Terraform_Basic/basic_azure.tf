

# Import block for resource group
import {
  to = azurerm_resource_group.example
  id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}"
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Import block for storage account
import {
  to = azurerm_storage_account.example
  id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_name}"
}

# Create a storage account
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = var.environment
  }
}
