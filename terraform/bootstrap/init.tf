variable "access_key" {}
variable "secret_key" {}
variable "region" {}


provider "aws" {
  version = "~> 1.0"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_s3_bucket" "backend" {
  bucket = "fec-dns-terraform-state"

  versioning {
    enabled = true
  }
}

# 
resource "aws_iam_user" "deployer" {
  name = "circleci-deployer"
}

resource "aws_iam_user_policy" "circleci_deployer_policy" {
  name = "route53-deployment"
  user = "${aws_iam_user.deployer.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "route53:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["${aws_s3_bucket.backend.arn}"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": ["${aws_s3_bucket.backend.arn}/*"]
    }
  ]
}
EOF
}
