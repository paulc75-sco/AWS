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
