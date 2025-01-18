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



