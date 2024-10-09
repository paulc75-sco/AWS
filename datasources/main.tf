provider "aws" {
  region = "us-east-1"
}


data "aws_instance" "testing_datasources" {
  
}

output "aws_instance_output" {
  value = aws_instance.arn
}