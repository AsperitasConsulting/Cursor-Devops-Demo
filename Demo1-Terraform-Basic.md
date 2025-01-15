# Demo 1:  Basic Terraform configuration and GitHub workflow

Pull in basic_azure.tf into the composer and type in the following compose instruction:
```
write terraform to create an azure storage account
```

You will see many literal values used as argument input. Let's make this more robust.
```
change to make all literals variable inputs
```
> Notice that file terraform.tfvars was created with the variable input values.  If your tfvars naming convention is different, you can ask for the rename or simply do it in the editor.

Typically Terraform files are separated out for readability.
```
separate out variable definitions into file basic_azure_variables.tf
separate out the terraform and provider blocks into file basic_azure_versions.tf
```

Pull up an editor for the empty file ```.github/workflows/terraform-basic.yaml```. Click the "+" icon in the compose dialog. this will start a new compose session with the workflow yaml automatically pulled in.  Execute the following command.
```
write a github workflow to run a plan and apply for the terraform we just wrote
```

This is good, but I want a couple of additional features.
```
change the trigger to be workflow_dispatch

remove the push and pull_request triggers

add an input for apply. Only execute the apply step if the apply input is selected.

add an optional destroy step

if destroy is selected, have the plan step support it

add support for passing the terraform.tfvars for variable values

use the terraform.tfvars file already in the configuration. Don't accept the values as inputs

I plan multiple tfvars files. please add an input for the tfvars file name
```

Now let's do an init and plan to see how we do.
```
perform a terraform init and plan on this configuration
```
> Note that Cursor can't execute commands for me, so it gives me instructions