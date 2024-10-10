output "aws_ami" {
  value = data.aws_ami.testing_datasources.id

}

output "aws_creation_date" {
  value = data.aws_ami.testing_datasources.creation_date

}

output "aws_description" {
  value = data.aws_ami.testing_datasources.description

}


output "aws_architecture" {
  value = data.aws_ami.testing_datasources.architecture

}
