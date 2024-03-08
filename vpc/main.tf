resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_nt
  tags = {
    Name = var.name_vpc
  }
}
###subnet creation
resource "aws_subnet" "sub1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr_sub1
  availability_zone = var.az1
  tags = {
    Name = var.sub1name
  }
}
resource "aws_subnet" "sub2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr_sub2
  availability_zone = var.az2
  tags = {
    Name = var.sub2name
  }
}

########### internate gate creation

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw
  }
}

########## route table creation

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt
  }
}

resource "aws_route_table_association" "rt-pub" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rt-pvt" {
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.rt.id
}

#resource "aws_eip" "eip" {
#instance = aws_instance.linux-pub1.id
#domain = "vpc"

#tags = {
#  Name = "eip"
# }
#}

#resource "aws_nat_gateway" "ngw" {
# allocation_id = aws_eip.eip.id
#subnet_id     = aws_subnet.sub1.id


# tags = {
# Name = "ngw"
# }
#}


############################instace creation################

resource "aws_security_group" "psg" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.psg
  }
}

resource "aws_vpc_security_group_ingress_rule" "psg-allow1" {
  security_group_id = aws_security_group.psg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "psg-allow2" {
  security_group_id = aws_security_group.psg.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

