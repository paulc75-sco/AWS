resource "aws_db_instance" "dbinstance" {
  allocated_storage    = var.astorage
  db_name              = var.db_name
  engine               = var.engine[0]
  engine_version       = var.engine_version[0]
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  instance_class       = var.instance_class[0]
  username             = var.username
  password             = var.password

  tags = {
    Create_date_time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp())
  }

  lifecycle {
    ignore_changes = [
      tags["Create_date_time"],
    ]
  }

}
