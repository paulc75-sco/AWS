resource "aws_dynamodb_table" "dynamodb" {
  #This resource creates the DynamoDB
  name           = var.name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  range_key      = var.range_key

  attribute {

    name = var.hash_key
    type = "S"
  }

  attribute {
    name = var.range_key
    type = "S"
  }

  ttl {
    attribute_name = "timetoexsist"
    enabled        = true
  }

  global_secondary_index {
    #This section creates the secondary index
    name               = var.si_name
    hash_key           = var.hash_key
    range_key          = var.range_key
    write_capacity     = var.si_write_capacity
    read_capacity      = var.si_read_capacity
    projection_type    = var.projection_type
    non_key_attributes = ["${var.hash_key}"]

  }

  tags = {
    Name             = var.name
    Create_date_time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp())
  }

  lifecycle {
    ignore_changes = [
      tags["Create_date_time"],
    ]
  }

}
