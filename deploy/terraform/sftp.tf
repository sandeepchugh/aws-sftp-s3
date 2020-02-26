resource "aws_transfer_server" "sftp_server" {
  identity_provider_type = "SERVICE_MANAGER"
  logging_role = aws_iam_role.sftp_server_role.arn

  tags {
    "NAME" = "sftp transfer server"
    "Environment" = var.env_name
  }
}

resource "aws_transfer_user" "sftp_user" {
  server_id = aws_transfer_server.sftp_server.id
  user_name = "tftestuser"
  role = aws_iam_role.sftp_server_role.arn
  home_directory = "/${aws_s3_bucket.s3_bucket.bucket}"
   tags {
     "NAME" = "tftestuser"
   }
}

resource "aws_transfer_ssh_key" "sftp_user_ssh_key" {
  body = "add ssh public key"
  server_id = aws_transfer_server.sftp_server.id
  user_name = aws_transfer_user.sftp_user.user_name
}