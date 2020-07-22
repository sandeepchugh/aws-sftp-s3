# aws-sftp-s3


### What is this?
This is a demo project setting up an sftp server using the following AWS services:
- Transfer Server(SFTP) 
- S3 (SFTP store)
- IAM (for security)

### What language is this developed in?
The IAC(Infrastructure as code) code is Terraform 

### How is this deployed?
The project uses terraform to deploy the resources and depencencies in AWS.

Install terraform in your local machine or build server using terraform cli
https://www.terraform.io/downloads.html

Terraform uses the aws provider to interact with aws services. More details on 
the aws provider are available at 
https://www.terraform.io/docs/providers/aws/index.html
```
#### IAC (Terraform)

DEVELOPMENT
```shell script
terraform init -backend-config dev.tfbackend
terraform plan -var-file dev.tfvars
terraform apply -var-file dev.tfvars

```

Note: Change the bucket name in dev.tfbackend to a unique bucket name 

### How does this work?
Once the SFTP endpoint has been setup, it can be accessed via any FTP client. Users need to be setup using the AWS Console or via Terraform.
