# Udacity devops on azure course

This is an azure course on devops with plenty of hands on projects, and the code ran directly on an azure free account is here!


## To deploy the infrastructure as code bit with packer and save your packer image:
1. Open either the `demo.json` file or `vejo2.json` files
2. Replace the values of `client_id`, `client_secret`, `tentant_id` and `subscription_id` in the builders section with your own
3. In order to get the values above, you will need to create a resource group and credentials, as per this [link](https://learn.microsoft.com/pt-br/azure/virtual-machines/linux/build-image-with-packer)
4. Login in your Azure account
5. From the Azure Console, open the Bash terminal and upload your .json file.
[upload](bash-upload.jpeg)
6. enter the command to actually create an image:
7. `packer build yourimage.json`
8. `az image list`
9. save your image id

## To deploy the infrastructure as code bit with terraform:
1. Login on your azure account with `az login`
2. go to the terraform folder, then either terraform1 or project1
3. on `variables.tf`, change the default on `"vm_image_id"` to your packer image id
4. example: "/subscriptions/SUBSCRIPTIONID/resourceGroups/MYRESOURCEGROUP/providers/Microsoft.Compute/images/myPackerImage"
5. run `terraform init` to get it started
6. run `terraform plan` to view the resources it will be created
7. run `terraform apply` to apply your plan and deploy your infrastructure
8. run `terraform show` to see your infrastructure!
9. run `terraform destroy` to destroy your infrastructure and save on resources!