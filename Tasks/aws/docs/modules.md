# Terraform Modules
1. Modules are containers for multiple resources that are used together.

2. A module consists of a collections of .tf and .tf.jsson files kept together in a directory

3. Modules are the main way to package and reuse resources configurations with Terraform.

```
$ tree minimal-module
.
|--- README.md
|--- main.tf
|--- variables.tf
|--- outputs.tf
```
Reference [For already readily available to use for terraform](https://registry.terraform.io/browse/modules)

Create VPC using provided modules by terraform
```bash
provider "aws" {
  region = "eu-west-1"
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.17.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.0.0.0/24"]
  public_subnets  = ["10.0.1.0/24"]

  tags = {
    Name        = "test-vpc-module"
    Environment = "dev"
  }
}
```
Create EC2 Instance within the VPC using terraform EC2 instance module
```bash
module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"

  name = "single-instance"
  
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name   = "Sample-Instance"
    Environment = "dev"
  }
}
```
## [Create Own Module (next topic >>)](../../aws/docs/own_modules.md)
