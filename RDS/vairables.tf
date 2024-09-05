variable "region" {
    default = us-east-1
    type = string
  
}

variable "astorage" {
    default = 10
    type = number
  
}

variable "db_name" {
  default = null
  type = string
}

variable "engine" {
    default = "mysql"
    type = string
  
}

variable "engine_version" {
    default = "8.0"
    type = string
  
}

variable "parameter_group_name" {
    default = "default.mysql8.0"
    type = string
  
}

variable "skip_final_snapshot" {
  type = string
  default = "False"
}