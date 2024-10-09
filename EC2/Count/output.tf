output "associate_public_ip_address" {
  value = aws_instance.countec2.*.public_ip

}
output "public_dns" {
  value = aws_instance.countec2.*.public_dns

}




