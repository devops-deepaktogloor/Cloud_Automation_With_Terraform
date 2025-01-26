terraform {}

#number list
variable "number_list" {
  type = list(number)
  default = [1,2,3,4,5]
}

# Object list of person
variable "person_list" {
  type = list(object({
    name = string
    age = number
    is_male = bool
  }))

  default = [
    {
      name = "John"
      age = 20
      is_male = true
    },
    {
      name = "Jane"
      age = 22
      is_male = false
    }
  ]
}

variable "map_list" {
    type = map(number)
    default = {
      "one" = 1
      "two" = 2
      "three" = 3
    }
  
}

    

# Calculations
locals {
  mul = 2 * 2
  add = 2 + 2
  # double the value
  double = [for num in var.number_list : num * 2]
  # print only odd
  odd = [for num in var.number_list : num if num % 2 != 0]
}

output "output" {
  value = local.add
}

output "my_list"{
    value = local.odd
}