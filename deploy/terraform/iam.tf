resource "aws_iam_role" "sftp_server_role" {
  name = "sftp_server_role${var.env_suffix}"
  assume_role_policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Action":"sts:AssumeRole",
      "Principal":{
        "Service":"transfer.amazonaws.com"
      },
      "Effect":"Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "sftp_server_role_policy" {
  name = "sftp_server_role_policy${var.env_suffix}"
  role = aws_iam_role.sftp_server_role.id

  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Effect":"Allow",
      "Action":[
        "logs.CreateLogGroup",
        "logs.CreateLogStream",
        "logs.PutLogEvents",
        "logs.DescribeLogStreams"
      ],
      "Resource":"*"
    },
    {
      "Effect":"Allow",
      "Action":[
          "s3:ListBucket",
          "s3:GetBucketLocation"
      ],
      "Resource": "${aws_s3_bucket.s3_bucket.arn}"
    },
    {
      "Effect":"Allow",
      "Action":[
          "s3:PutObject",
          "s3:GetObject",
          "s3:GetObjectVersion"
      ],
      "Resource": "${aws_s3_bucket.s3_bucket.arn}/*"
    }
  ]
}
EOF
}