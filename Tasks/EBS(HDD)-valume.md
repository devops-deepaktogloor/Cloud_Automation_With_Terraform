# Now Let's Jump into Small tasks to automate and practice #
## Activity:2
## Create EBS Volume (Hard Disk) (Manual) ##

**Note:** Make sure your 'Access Key' & 'Secret Key's are created and activated.

1. Create EBS Volume
    - Navigate to EC2 Services from the console
    - Click on EBS Volume from the left pane
    - Click on create button
      ![Reference](../snaps/EBS_volumes.png)
    - Select the volumes type and size (other parameters too if you needed, not required otherwise)
      ![Reference](../snaps/EBS_volumes-type-size.png)
    - Click on Create Button to create the EBS Volume (*it will take fracations of seconds to be active*)
      ![Reference](../snaps/EBS_volumes-type-size-created.png)
    - Click on the Volume ID to see more details respective to the Volume created
      ![Reference](../snaps/EBS_volumes-type-size-created-moreinfo.png)

## Create EBS Volume (Hard Disk) (Terraform) ##
## *Note: * At a time terraform supports only 1 source, hence kindly comment out the previouly created resource using /* with code */##

2. Create EBS Volume
    - Create a file with name EBS_Volumes.tf
      ```
      resource "aws_ebs_volume" "Automation" {
        availability_zone = "us-west-1a"
        size              = 40

        tags = {
        Name = "Automation"
            }
        }
      ```
    - Feel free to change the Volume Name, Zone & Size as per your own preference.
    - Now validate your tf file using below command to check syntax error or value errors
      ```powershell
      terraform validate
      ```
      ![Reference](../snaps/EBS_volumes-tf-validate.png)
    - Create plan of resource you are going to create
      ```powershell
      terraform plan
      ```
      ![Reference](../snaps/EBS_volumes-tf-plan.png)
    - If resource you are going to create are correct then simply apply command
      ```powershell
      terraform apply
      ```
      ![Reference](../snaps/EBS_volumes-tf-apply.png)

3. Verify the EBS (Elastic Block Store) created using terraform, on the console.
    - Navigate to EC2 Instance Services
    - Select EBS Volumes link from left pane
      ![Console_SecurityGroup](../snaps/EBS_volumes-console-verify.png)
    - Verify all the attributes are correct clicking no the group which is created.
      ![Console_SecurityGroup_Attributes](../snaps/EBS_volumes-console-verify-moreinfo.png)
