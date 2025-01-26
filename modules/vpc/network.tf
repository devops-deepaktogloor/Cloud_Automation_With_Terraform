provider "aws" {
  region = "us-east-1"
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

