# Cloud_Automation_With_Terraform
Practice and Project to Automation Infrastructure (IAC) or (IaaS) using Terraform &amp; Python

# STEP: 1
# Pre-requisite
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
  
# Install Chocolatey for Individual Use:

1. **First**, ensure that you are using an **administrative shell** - you can also install as a non-admin, check out [Non-Administrative Installation](https://community.chocolatey.org/docs/installation#non-administrative-installation).

2. **Install with powershell.exe**

    > **NOTE**  
    > Please inspect https://community.chocolatey.org/install.ps1 prior to running any of these scripts to ensure safety. We already know it's safe, but you should verify the security and contents of **any** script from the internet you are not familiar with. All of these scripts download a remote PowerShell script and execute it on your machine. We take security very seriously. [Learn more about our security protocols](https://community.chocolatey.org/security).

    With PowerShell, you must ensure `Get-ExecutionPolicy` is not Restricted. We suggest using `Bypass` to bypass the policy to get things installed:

    - Run `Get-ExecutionPolicy`. If it returns `Restricted`, then run `Set-ExecutionPolicy AllSigned` or `Set-ExecutionPolicy Bypass -Scope Process`.

    Now run the following command:

    ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```

3. **Paste the copied text into your shell and press Enter.**

4. **Wait a few seconds for the command to complete.**

5. **If you don't see any errors, you are ready to use Chocolatey!** Type `choco` or `choco -?` now, or see [Getting Started](https://community.chocolatey.org/docs/getting-started) for usage instructions.

# STEP: 2
1. Create Project Folder (with you desired folder name eg. Terraform_Automation)
2. Open VS editor code
3. Open the Folder which you created.
4. Now go to plugins and add below plugins.
   - HashiCorp Terraform
   - Terraform

# STEP: 3
1. Create some files as below. (These below file names are optional)
    - provider.tf    
    - main.tf         
    - inputs.tf
    - outputs.tf

