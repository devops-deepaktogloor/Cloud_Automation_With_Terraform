terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "~>5.83"
    }
  }
}

locals {
    owner = "ABC"
    name = "XYZ"
}


resource "aws_instance" "my-instance" {
  ami           = "ami-0ac4dfaf1c5c0cce9"
  instance_type = var.aws_instance_type

  root_block_device {
    delete_on_termination = true
    volume_size = var.root_variable_config.v_size
    volume_type = var.root_variable_config.v_type
  }

  tags = merge(var.addtional_tags, {
    Name = locals.name
  })
}

