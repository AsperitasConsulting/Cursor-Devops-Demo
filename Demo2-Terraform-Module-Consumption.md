# Demo 2:  Terraform configuration using module consumption

Modules referenced in this demo are from the Azure Verified Module set.
* [Storage Account](https://github.com/Azure/terraform-azurerm-avm-res-storage-storageaccount)
* [Resoruce Group](https://github.com/Azure/terraform-azurerm-avm-res-resources-resourcegroup)

Pull in module_azure.tf into the composer and type in the following compose instruction:
```
write terraform to create an azure storage account using module github.com/Azure/terraform-azurerm-avm-res-storage-storageaccount
```

This is explicitly what I asked for, but I need improvements.
```
change the resoruce group to use module github.com/Azure/terraform-azurerm-avm-res-resources-resourcegroup
```
> Note that I mispelled "resource group", but it understood what I meant anyway

Let's work on variable inputs.
```
change the tags assigned so that they are specified by a variable map input

change to make all literals variable inputs
```

Now let's work on readability.
```
separate out variable definitions into file module_azure_variables.tf

separate out the terraform and provider blocks into file module_azure_versions.tf
```

Now let's not accept automatic updates.
```
For module references, specify the latest tag explicitly
```
> Note: While the syntax is correct, the tag numbers are not -- changing that manually.

Now let's do an init and plan to see how we do.
```
perform a terraform init and plan on this configuration
```
> Note that Cursor can't execute commands for me, so it gives me instructions

The plan surfaced errors on three arguments.
```
remove all optional arguments for the storage_account module call

restore the tags argument
```

We did better, but have moved on to an invalid reference to the resource group location, which I fix manually.
