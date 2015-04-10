## What is Terraform?

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

Configuration files describe to Terraform the components needed to run a single application or your entire datacenter. Terraform generates an execution plan describing what it will do to reach the desired state, and then executes it to build the described infrastructure. As the configuration changes, Terraform is able to determine what changed and create incremental execution plans which can be applied.

## awsvpc-terraform
I have written this to create AWS VPC which has public and private subnet along with a NAT Instance.

## Getting Started

### Install Terraform 

Find the [appropriate package](https://terraform.io/downloads.html) for your system and download it. Terraform is packaged as a zip archive.

After downloading Terraform, unzip the package into a directory where Terraform will be installed. The directory will contain a set of binary programs, such as terraform, terraform-provider-aws, etc. The final step is to make sure the directory you installed Terraform to is on the PATH. See this [page](http://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux) for instructions on setting the PATH on Linux and Mac. This [page](http://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows) contains instructions for setting the PATH on Windows.

### Place your aws credentials

Create a file `terraform.tfvars` and place your keys there. It should look something like below. Since this file contains sensitive information, it shouldn't be checked to github

```
access_key  = "foo"
secret_key  = "bar"
key_name    = "deploy-tomar"
```

## Running
```
$ terraform plan
$ terraform apply
```
