# variables.tf

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "acl" {
  type        = string
  description = "The canned ACL (Access Control List) for the S3 bucket"
  default     = "private"
}

