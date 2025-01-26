terraform {}

locals{
    value = "Hello World"
}

variable "string_list" {
    type = list(string)
    default = [ "srv1", "srv2", "srv3" ]
}

# Split the string basis of space
output "output" {
    #value = upper(local.value)
    # value = endswith(local.value, "Hello")
    # value = startswith(local.value, "Hello")
    value = split(" ", local.value)
}