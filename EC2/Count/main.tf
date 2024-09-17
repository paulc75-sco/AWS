resource "aws_instance" "countec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  count                       = 3
  tags = {
    Name = "Server-${count.index + 1}"
  }


}
