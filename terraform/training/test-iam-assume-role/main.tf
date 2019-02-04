#####################################################################
##
##      Created 2/4/19 by admin. for test-iam-assume-role
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

provider "aws" {
  assume_role {
    role_arn = "${var.role_arn}"
  }
}

data "aws_s3_bucket" "selected" {
  bucket = "${var.bucket_name}"
}