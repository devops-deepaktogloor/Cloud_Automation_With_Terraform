variable "aws_instance_type" {
    description = "What type of instance do you want to create"
    type = string
    
    validation {
        condition = var.aws_instance_type == "t2.micro" || var.aws_instance_type == "t3.micro"
        error_message = "Please enter a valid instance type."
    }
}

variable "root_variable_config" {
    type = object({
      v_size = number
      v_type = string
    })
    default = {
      v_size = 8
      v_type = "gp2"
    }
}

variable "addtional_tags" {
    type = map(string)      #expecting key=value format
    default = {}
}