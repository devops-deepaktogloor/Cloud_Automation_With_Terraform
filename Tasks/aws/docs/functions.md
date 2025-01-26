# Terraform Functions
- Built-in functions that you can call from within expression to transform and combine values.
Eg: max(5,12,9)
output: 12

```powershell
terraform {}

locals{
    value = "Hello World"
}

variable "string_list" {
    type = list(string)
    default = [ "srv1", "srv2", "srv3" ]
}
```
### make Hello World in lower case 
```bash
output "output" {
    value = lower(local.value)
}

output:
Changes to Outputs:
  + output = "hello world"
```
### To make entire string in Upper case
```bash
output "output" {
    value = upper(local.value)
}

Output:
Changes to Outputs:
  + output = "HELLO WORLD"
```
### Verify starts with Hello string
```bash
output "output" {
    value = startswith(local.value, "Hello")
}

output:
Changes to Outputs:
  + output = true
```
### Verify starts with World string
```bash
output "output" {
    value = startswith(local.value, "World")
}

output:
Changes to Outputs:
  + output = false
```
### Verify ends with World string
```bash
output "output" {
    value = endswith(local.value, "World")
}

output:
Changes to Outputs:
  + output = true
```
# Split the string basis of space
```bash
output "output" {
    value = split(" ", local.value)
}

Output:
Changes to Outputs:
  + output = [
      + "Hello",
      + "World",
    ]
```
## [Next_Topic > ](../../../Tasks/aws/docs/count&for_each.md) ##