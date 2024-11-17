output "aws_vpc" {
  value = "The VPC id is ${aws_vpc.vpc.id}"

}

output "aws_eip" {
  value = "The NAT Gateway Public IP is ${aws_eip.eip.public_ip}"


}


