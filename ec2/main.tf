#data "aws_subnet" "sub1"{
 #  id = "subnet-08ece5ff1bd1a6780"
#}

#data "aws_security_group" "prodsg"{
 #  name = "terraform-20240210180447290300000001"
#}
#data "aws_vpc" "pvpc"{
 #   id = "vpc-01e3ed3ed29270a64"
#}


resource "aws_instance" "linux-pub1" {
  ami                         = var.ami_id
  instance_type               = var.ins_type
  associate_public_ip_address = true
  key_name                    = var.ec2_key
  subnet_id                   = var.subnet_id
 # vpc_security_group_ids      = data.aws_security_group.prodsg.id

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  EOF

  tags = {
    Name = "linux-pub1"
  }
}
