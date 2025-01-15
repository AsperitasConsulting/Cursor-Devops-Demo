# Demo 3:  Scripting in three dialects

Pull in backendSetup.sh into the composer and type in the following compose instruction:
```
write a bash script that uses the azure cli to setup a storage account for use as a Terraform backend
```
> Note it accepts location, resource group name, storage account name, and container name as arguments, but defaults them if they are not provided.

It did what I asked for, but let's ask for changes
```
make the storage account name required and error out if it's not provided
```

Pull in backendSetup.cmd into a new composer ("+" icon) and type in the following compose instruction:
```
write a windows command that does the same thing as the bash script
```

The resulting script assumed that the resource group and storage account already exists. Let's fix that.
```
Add the azure cli commands to create the resource group and storage account
```

Pull in backendSetup.ps1 into a new composer ("+" icon) and type in the following compose instruction:
```
write a powershell script that uses the azure cli to setup a storage account for use as a Terraform backend. make it have the same capabilities as the bash and windows command scripts have
```
> Note: The PowerShell script should have the same capabilities as the bash and cmd scripts - creating a resource group and storage account if they don't exist, with the storage account name being required.
