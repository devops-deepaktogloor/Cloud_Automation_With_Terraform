# Project : Deploy Static Web #
## Activity: 5

**Note:** Make sure your 'Access Key' & 'Secret Key's are created and activated.

## 1.    Let's Understand and try creating manually ##
1.  Goto S3 Bucket Services
    ![S3Bucket](../../../snaps/S3-console_createbucket.png)
2.  Create S3 Bucket Manually
    ![S3Bucket](../../../snaps/S3-web-bucket.png)
3.  Block Public Access settings for this bucket - uncheck
    Reson behind we want to access the website globally. and check acknowledge checkbox
    ![BucketReady](../../../snaps/S3-web-bucket-publicAccessEnable.png)
4.  Leave the rest of the setting defaul as is, will make changes as and when needed (for better understanding purpose)
    and click on Create Button.
    ![create](../../../snaps/S3-web-bucket-create.png)
5.  By now bucket is created
    ![created](../../../snaps/S3-web-bucket-created.png)
6.  Click on the bucket created, click on upload website's index.html file and click on upload.
    ![upload](../../../snaps/S3-web-bucket-uploadfile.png)
7.  To access the website, click on index.html file uploaded.
    ![access](../../../snaps/S3-web-bucket-objectaccess.png)
    **[Note]** This still cannot be accessed because it will given an *Access Denied* error message on the page.
    ![AccessDenied](../../../snaps/S3-web-bucket-access-denied.png)
    because since we have enabled to public access at time of creation of bucket it does required additional policy to be applied as it's security and data privicy is concerned. it does additionally required 
    [*Setting permissions for website access*](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteAccessPermissionsReqd.html)
    
    - Step 1: Edit S3 Block Public Access settings - already at the time of creation
    - Step 2: Add a bucket policy - add these under permissions tab
      ![add_policy](../../../snaps/S3-web-bucket-addpolicy.png)
    - Object access control lists
8.  Try, accessing object website will be able to see sucessfully.
    ![launched](../../../snaps/S3-web-bucket-refresh.png)

## 2.    Let's Understand and try creating using Terraform Automation ##
1.  As we already seen the how to create S3 bucket and upload the file, so just copy pasting same provider, resources as below
    ```powershell
        terraform {
            required_providers {
            aws = {
            source  = "hashicorp/aws",
            version = "~>5.83"
            }
            random = {
            source  = "hashicorp/random"
            version = "3.6.3"
                }
            }
        }

        resource "random_id" "rand_id" {
            byte_length = 8
        
        }

        resource "aws_s3_bucket" "S3website-bucket" {
            bucket = "website-bucket-${random_id.rand_id.hex}"
        }

        resource "aws_s3_object" "index_html" {
            bucket = aws_s3_bucket.S3website-bucket.id
            source = "./index.html"
            key = "index.html"
        }

        output "website" {
            value = random_id.rand_id.hex
        }
    ```
    ![createUpload](../../../snaps/S3-main.tf_S3_create_upload.png)
2.  Terraform apply to see bucket created and file uploaded
    ![apply](../../../snaps/S3-main.tf_S3_apply.png)
3.  Verify console bucket created
    ![console](../../../snaps/S3-main.tf_S3_consoleBucket.png)
4.  Verify file uploaded under same bucket
    ![file](../../../snaps/S3-main.tf_S3_file_uploaded.png)
5.  Adding public access block disable in main.tf file
    ```powershell
        resource "aws_s3_bucket_public_access_block" "example" {
            bucket = aws_s3_bucket.example.id

            block_public_acls       = false
            block_public_policy     = false
            ignore_public_acls      = false
            restrict_public_buckets = false
        }
    ```
6.  Verify before terraform apply persmission access block should be on.
    ![publicaccess](../../../snaps/S3-main.tf_S3_perm-pub-access.png)
7.  Run the terraform apply and re-check, it should be off now.
    ![publicaccessOn](../../../snaps/S3-main.tf_S3_perm-pub-access-apply.png)
    - Verify permission public access is off.
    ![publicaccessOff](../../../snaps/S3-main.tf_S3_perm-pub-access-off.png)
8.  Similarly apply Bucket policy for acess over the internet.
    ```powershell
    resource "aws_s3_bucket_policy" "static_web" {
        bucket = aws_s3_bucket.S3website-bucket.id
        policy = jsonencode(
            {
            Version = "2012-10-17",
            Statement = [
                {
                Sid = "PublicReadGetObject",
                Effect = "Allow",
                Principal = "*",
                Action = "s3:GetObject",
                Resource = "arn:aws:s3:::${aws_s3_bucket.S3website-bucket.id}/*"
                }
            ]
            }
        )
    }
    ```
    - Verify Before terraform apply 
    ![policynotapplied](../../../snaps/S3-main.tf_S3_policy_empty.png)
9.  Now terraform apply and re-verify policy applied.
    ![policyapplied](../../../snaps/S3-main.tf_S3_policy_applied.png)    
10. Finally Resource: aws_s3_bucket_website_configuration has to be enabled under property tab
    ```powershell
        resource "aws_s3_bucket_website_configuration" "static_web" {
            bucket = aws_s3_bucket.S3website-bucket.id

        index_document {
            suffix = "index.html"
        }
    }
    ```
    - Before S3 static website hosting
    ![staticWebHosting](../../../snaps/S3-main.tf_S3_static_web_hosting_disabled.png)
11. After terraform apply and re-verify property tab, static website hosting link will be generated.
    ![linkGenerated](../../../snaps/S3-main.tf_S3_static_web_hosting_generated.png)
12. Copy and paste the [url]("http://website-bucket-06beff60851f76e2.s3-website-us-east-1.amazonaws.com") in the browser to land on 
    the website
    ![website](../../../snaps/deployed-website.png)
    




