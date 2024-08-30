resource "aws_vpc" "vpc" {
  cidr_block = var.subnet

  tags = {
    Name   = var.vpcname
    subnet = var.subnet
    region = var.region
  }
}


resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.privatesubnet
  depends_on = [aws_vpc.vpc]

  tags = {
    Name   = "Mr X Network - Private Subnet"
    Subnet = var.privatesubnet
  }

}

resource "aws_subnet" "publicsubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.publicsubnet
  depends_on = [aws_vpc.vpc]

  tags = {
    Name   = "Mr X Network - Public Subnet"
    Subnet = var.publicsubnet
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Mr X Network - IGW"
  }

}

resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Mr X Route Table"
  }


}

resource "aws_route_table_association" "routetableassociationpublic" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.routetable.id

}

resource "aws_route_table_association" "routetableassociationprivate" {
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.routetable.id

}
