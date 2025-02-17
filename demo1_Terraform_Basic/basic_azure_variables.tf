# Variable declarations
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "example-resources"
}

variable "subscription_id" {
  description = "The Azure Subscription ID to be used for resource creation"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "examplestorageacc123"
}

variable "account_tier" {
  description = "Performance tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type for the storage account"
  type        = string
  default     = "LRS"
}

variable "environment" {
  description = "Environment tag value"
  type        = string
  default     = "dev"
}
