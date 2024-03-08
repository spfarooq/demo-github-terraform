variable "vpc_nt" {
  type = string
}

variable "name_vpc" {
  type = string
}

variable "cidr_sub1" {
  type    = string
  default = "10.0.1.0/24"
}
variable "cidr_sub2" {
  type    = string
  default = "10.0.2.0/24"
}
variable "az1" {
  type    = string
  default = "us-east-1a"
}
variable "az2" {
  type    = string
  default = "us-east-1b"
}
variable "sub1name" {
  type    = string
  default = "prodsub1"
}
variable "sub2name" {
  type    = string
  default = "prodsub2"
}
variable "igw" {
  type    = string
  default = "prodigw"
}
variable "rt" {
  type    = string
  default = "prodrt"
}
variable "resource" {
  type    = string
  default = "prod-rt-ass"
}
variable "psg" {
  type    = string
  default = "prodsg"
}