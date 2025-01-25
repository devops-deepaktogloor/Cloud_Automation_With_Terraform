terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "~>5.83"
    }
  }
}

data "aws_ami" "name" {
    most_recent = true
    owners = ["amazon"]
}

output "aws_ami" {
    value = data.aws_ami.name.id
}

data "aws_availability_zones" "name" {
    state = "available"
}

output "name" {
  value = aws_availability_zones.name
}