resource "aws_s3_bucket" "s3_bucket" {
  bucket = local.bucket_name
  acl = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags {
    "Name" = local.bucket_name
    "Environment" = var.env_name
  }

  lifecycle_rule {
    id = "Delete after 7 days"
    enabled = true

    expiration {
      days = 7
    }
  }
}

resource "aws_s3_account_public_access_block" "block_s3_bucket_public_access" {
  bucket = aws_s3_bucket.s3_bucket.id
  restrict_public_buckets = true
  ignore_public_acls = true
  block_public_acls = true
  block_public_policy = true
}
