# aws-sftp-s3
sftp server on aws with s3 as  file store

## Deployment

```bash
cd deploy/terraform
terraform init -backend-config dev.tfbackend
terraform plan -var-file dev.tfvars
terraform apply -var-file dev.tfvars
```
