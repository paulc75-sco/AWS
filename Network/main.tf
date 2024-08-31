resource "aws_vpc" "vpc" {
  #This resource creates the VPC
  cidr_block = var.subnet

  tags = {
    Name   = "${var.name} - VPC"
    subnet = var.subnet
    region = var.region
  }
}


resource "aws_subnet" "privatesubnet" {
  #This resourcecreates the private subnet
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.privatesubnet
  depends_on = [aws_vpc.vpc]

  tags = {
    Name   = "${var.name} -  Private Subnet"
    Subnet = var.privatesubnet
  }

}

resource "aws_subnet" "publicsubnet" {
  #This resource creates the public subnet
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.publicsubnet
  depends_on = [aws_vpc.vpc]

  tags = {
    Name   = "${var.name} -  Public Subnet"
    Subnet = var.publicsubnet
  }
}

resource "aws_internet_gateway" "igw" {
  #This resource creates the Internet Gateway 
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name} - IGW"
  }

}


resource "aws_eip" "eip" {
  #This resource creates the elastic ip for the NAT GAteway
  domain = "vpc"

  tags = {
    Name = "${var.name} - NAT Gateway EIP"
  }

}


resource "aws_nat_gateway" "natgateway" {
  #This resource creates the Public NAT gateway and places it in the public subnet
  connectivity_type = "public"
  allocation_id     = aws_eip.eip.id
  subnet_id         = aws_subnet.publicsubnet.id
  depends_on        = [aws_internet_gateway.igw]

  tags = {
    Name = "${var.name} - NAT Gateway"
  }


}

resource "aws_route_table" "publicroutetable" {
  #This resource creates the route table for the public subnet and routes traffice to the IGW
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.name} -  Public Route Table"
  }


}

resource "aws_route_table" "privateroutetable" {
  #This resource creates the route table for the private subnet and routes traffice to the NAT Gateway
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgateway.id
  }

  tags = {
    Name = "${var.name} -  Private Route Table"
  }
}


resource "aws_route_table_association" "routetableassociationpublic" {
  #This resource associates the pubic route table to the public subnet
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicroutetable.id

}

resource "aws_route_table_association" "routetableassociationprivate" {
  #This resource associates the private route table to the private subnet
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.privateroutetable.id

}
