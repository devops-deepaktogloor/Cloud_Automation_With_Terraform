variable "vpc_config" {
    description = "To get the cidr and name of the pvc from the user"
    type = object({
      cidr_block = string
      Name = string
    })
}

variable "subnet_config" {
    description = "Accept the input from the user subnet details"
    type = map(object({
      cidr_block = string
      availability_zone = string
      
    }))
}