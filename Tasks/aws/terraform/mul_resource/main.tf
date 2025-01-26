terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.54.1"
    }
  }
}

locals {
    project = "project-01"
}
provider "aws" {
  region = var.region
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "${local.project}-vpc"
    }
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.${count.index}.0/24"
    count = 2
    tags = {
        Name = "${local.project}-subnet-${count.index}"
    }
}

# Create 4 instances 2 instances each subnet
resource "aws_instance" "main" {
    ami = "ami-0ac4dfaf1c5c0cce9"
    instance_type = "t3.micro"
    count = 4
    subnet_id = element(aws_subnet.main[*].id, count.index % length(aws_subnet.main))
    tags = {
        Name = "${local.project}-instance-${count.index}"
    }
}




# output "vpc_id" {
#     value = aws_subnet.main[0].id
# }




