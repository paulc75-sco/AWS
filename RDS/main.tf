resource "aws_db_instance" "dbinstance" {
    allocated_storage = var.astorage
    db_name = var.db_name
    engine = var.engine
    engine_version = var.engine_version
    parameter_group_name = var.parameter_group_name
    skip_final_snapshot = var.skip_final_snapshot
    instance_class = var.instance_class
    username = var.username
    password = var.password
  
}