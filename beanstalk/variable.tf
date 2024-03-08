variable "region" {
    description = "Please state the region"
  
}


variable "vpc_id" {
  description = "ID of the VPC where the Elastic Beanstalk environment will be deployed"
  default = "vpc-0806c6ba1b92162fe" #Edit it with your VPC ID
}

variable "subnet" {
    description = "Subnet ID of first zone"
    default = ["subnet-00a4ca15b2c9189af " , "subnet-0f97ed0b87af8129f"] #Edit it with your subnet ids
  
}

variable "instance_type" {
    description = "The type of instance"
    default =   "t2.micro"
  
}