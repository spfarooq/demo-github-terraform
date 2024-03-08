variable "ins_type" {
    type = string
    default = "t2.micro"
}
variable "ec2_key" {
    type = string
    default = "linux"
}

variable "cidr_sub1" {
    type = string
    default = "10.0.1.0/24"
}
variable "cidr_sub2" {
    type = string
    default = "10.0.2.0/24"
}
variable "ec2_name1" {
    type = string
    default = "linux-pub1"
}
variable "ami_id" {
    type = string
    default = ""
}