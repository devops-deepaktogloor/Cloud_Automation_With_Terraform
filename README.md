# Cloud_Automation_With_Terraform #
Practice and Project to Automation Infrastructure (IAC) or (IaaS) using Terraform &amp; Python

## STEP: 1 ##
## Pre-requisite ##
- Create AWS free tire account using this link: https://signin.aws.amazon.com/signup?request_type=register
- Install chocolatly on windows (which helps install any software on windows)
- Install Git & VS Code Editor
- Install Terraform
- Install aws CLI
  
  - To Install git
  ```powershell
    choco install -y git 
  ```
  ![Git](https://media.geeksforgeeks.org/wp-content/uploads/20220518201835/Screenshot20220518194605.jpg)
  
  - To Install VS Code Editor
  ```powershell
    choco install -y vscode
  ```
  ![VSCode](https://user-images.githubusercontent.com/30314198/53907920-7b31d180-404e-11e9-9926-58f574357639.png)

  - To Install Terraform
  ```powershell
    choco install -y terraform
  ```
  ![Terraform](https://cdn.hashnode.com/res/hashnode/image/upload/v1643044235298/duS1MkjmN.png)

  - To Install AWS CLI
  ```powershell
    choco install -y awscli
  ```
  ![awscli](https://hands-on.cloud/wp-content/uploads/2023/02/Install-AWS-CLI-Windows-10-1024x668.png)
  
## Install Chocolatey for Individual Use: ##
1. **First**, ensure that you are using an **administrativeshell** - you can also install as a non-admin, check out [Non-Administrative Installation](https://community.chocolatey.org/docs/installation#non-administrative-installation).
2. **Install with powershell.exe**

**NOTE**  
Please inspect https://community.chocolatey.org/install.ps1 prior to running any of these scripts to ensure safety. We already know it's safe, but you should verify the security and contents of **any** script from the internet you are not familiar with. All of these scripts download a remote PowerShell script and execute it on your machine. We take security very seriously. [Learn more about our security protocols](https://community.chocolatey.org/security).

With PowerShell, you must ensure `Get-ExecutionPolicy` is not Restricted. We suggest using `Bypass` to bypass the policy to get things installed:

- Run `Get-ExecutionPolicy`. If it returns `Restricted`, then run `Set-ExecutionPolicy AllSigned` or `Set-ExecutionPolicy Bypass -Scope Process`.

Now run the following command:

  ```powershell
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
  ```
3. Paste the copied text into your shell and press Enter.**
4. Wait a few seconds for the command to complete.
5. If you don't see any errors, you are ready to use Chocolatey! Type `choco` or `choco -?` now, or see [Getting Started](https://community.chocolatey.org/docs/getting-started) for usage instructions.

## STEP: 2 ##
1. Create Project Folder (with you desired folder name eg. Terraform_Automation)
2. Open VS editor code
3. Open the Folder which you created.
4. Now go to plugins and add below plugins.
   - HashiCorp Terraform
   - Terraform
---
## STEP: 3 ##
**Create some files as below. (These below file names are optional)**
  - provider.tf    
  - main.tf         
  - inputs.tf
  - outputs.tf
---
## STEP: 4 ##
## Create users with administrator privileges in aws and generate access keys ###
**Creating a Group for Administrators and Setting Up an IAM User**

### To Create a Group for Administrators ###
1. Sign in to the AWS Management Console and open the IAM console at [https://console.aws.amazon.com/iam/](https://console.aws.amazon.com/iam/).
2. In the navigation pane, choose **Groups**, and then choose **Create New Group**.
3. For **Group Name**, enter a name for your group, such as `Administrators`, and then choose **Next Step**.
4. In the list of policies, select the check box next to the `AdministratorAccess` policy.  
   * You can use the **Filter** menu and the **Search** box to filter the list of policies.
5. Choose **Next Step**, and then choose **Create Group**.
6. Your new group is listed under **Group Name**.

---

### To Create an IAM User for Yourself, Add It to the Administrators Group, and Create a Password ###
1. In the navigation pane, choose **Users**, and then choose **Add user**.
2. In the **User name** box, enter a user name.
3. Choose both:
   - **Programmatic access**
   - **AWS Management Console access**
4. Choose **Next: Permissions**.
5. Select the check box next to the **Administrators** group. Then choose **Next: Review**.
6. Choose **Create user**.

### To Sign In as the New IAM User ###
1. Sign out of the AWS Management Console.
2. Use the following URL format to sign in to the console:
   https://aws_account_number.signin.aws.amazon.com/console/
   Replace `aws_account_number` with your AWS account ID (without any hyphens).  
   For example, if your AWS account ID is `1234-5678-9012`, replace `aws_account_number` with `123456789012`.  
   For information about how to find your account number, see [Your AWS Account ID and Its Alias](https://docs.aws.amazon.com/IAM/latest/UserGuide/console_account_alias.html) in the IAM User Guide.
3. Enter the IAM user name and password that you just created.
4. When you're signed in, the navigation bar displays:
  your_user_name @ your_aws_account_id

### How To Generate Access Key ###
1. Go to the AWS management console, click on your Profile name, and then click on My Security Credentials. 
2. Go to Access Keys and select Create New Access Key
---
## STEP: 5 ##
### Configure Credentials from command prompts (CLI) ###
> To pass the credentials dynamically to void exposing secrate key and token to the other users

- Setup all your access key, Secret Key, Region, output format,  running below command in powershell terminal.

```PowerShell
aws configure
```
  ![AWS_Configure](https://k21academy.com/wp-content/uploads/2021/04/configration-done.png)
---
## STEP: 6 ##
### Terraform Support Scripting Lanaguage ###
- HashiCorp (HCL) 
Also be known as DSL (Domain Specific Language)

### Different types of terraform blocks ###
- Terraform Block
- Provider Block
- Data Block
- Resource Block
- Module Block
- Variable Block
- Output Block
- Locals Block.

Read this for more info : [Terraform_Blocks](https://www.geeksforgeeks.org/different-types-of-blocks-in-terraform/)
---

## STEP: 7 ##
### Create Provider Block using HCL in provider.tf file ###

- Please refer the file [provider.tf](provider.tf)

**This provider block needs to be executed using below command to install all the plug-ins and dependencies related to aws to work on**

```powershell
terraform init
```
# Now Let's Jump into Small tasks to automate and practice

## Task : 1 ##
Create Security Group:
- [Create Manually](Tasks\SecurityGroup.md)
- Create Using Terraform



