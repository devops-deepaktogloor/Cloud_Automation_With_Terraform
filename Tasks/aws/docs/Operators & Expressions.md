# Operators & Expressions in Terraform
1.  Lists
```bash
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
```
2.  Map
```bash
    variable "map_list" {
    type = map(number)
    default = {
      "one" = 1
      "two" = 2
      "three" = 3
    } 
    }
```
## Basic Calculations 
```bash
    # Calculations
    locals {
        mul = 2 * 2
        add = 2 + 2
        eq = 2 != 3
    }

    output "output" {
        value = local.add
    }
    output "output" {
        value = local.mul
    }
    output "output" {
        value = local.eq
    }
```

### Print the below list
```bash
    #number list
    variable "number_list" {
        type = list(number)
        default = [1,2,3,4,5]
    }
```
Output
```bash
    output "my_list"{
    value = var.number_list
    }

    Changes to Outputs:
  + my_list = [
      + 1,
      + 2,
      + 3,
      + 4,
      + 5,
    ]
```

### doube the values present in the above list using for loop
```bash
    locals {
        mul = 2 * 2
        add = 2 + 2
        double = [for num in var.number_list : num * 2]
    }
```
output:
```bash
    output "my_list"{
        value = local.double
    }

    Changes to Outputs:
  + my_list = [
      + 2,
      + 4,
      + 6,
      + 8,
      + 10,
    ]
```
### print only odd number with below expression
```bash
locals {
    odd = [for num in var.number_list : num if num % 2 != 0]
}
```
ouput
```bash
    ouput "output"{
        value = local.odd
    }

    Changes to Outputs:
    + my_list = [
        + 1,
        + 3,
        + 5,
        ]
```
## [Next_Topic > ](../../../Tasks/aws/docs/functions.md) ##
