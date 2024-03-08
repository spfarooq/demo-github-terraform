locals {
  bank_tag  = {
    tag_name  = "bank-s3"
    env_s3  = "bank-dev"
    group_s3  = "bank-it"
    createdBy = "bank-talha"
    
  }
  it_tags = {
    tag_name  = "s3"
    env_s3  = "dev"
    group_s3  = "it"
    createdBy = "talha"
    bucket_name = "tfbucketnew01"
  }
  bucket_name = "bank-tfbucketnew01"
}

resource "aws_s3_bucket" "tfbucketnew01" {
  bucket = local.bucket_name

  tags = local.bank_tag
}