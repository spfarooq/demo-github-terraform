# main.tf

provider "aws" {
  region = "us-east-1"  # Specify your desired AWS region
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  aws_s3_bucket_acl    = var.acl

  tags = {
    Name        = var.bucket_name
    Environment = "Production"
  }
}
