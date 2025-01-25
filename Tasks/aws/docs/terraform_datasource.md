# Terraform Data Structure
It allows to fetch and use information from:
- external sources or
- exsiting recources within your cloud infrastructure

useful for obtain dynamic data that you need for your configurations.
### To find out ami ids
```powershell
    data "aws_ami" "name" {
    most_recent = true
    owners = ["amazon"]
    }

    output "aws_ami" {
        value = data.aws_ami.name.id
    }
```
### To find out what are the availability zones
```powershell
    data "aws_availability_zones" "names" {
        state = "available"
    }

    output "name" {
    value = aws_availability_zones.names
    }
```

## [Next_Topic > ](../../../Tasks/aws/docs/variables.md) ##