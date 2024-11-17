variable "aws_regions" {
  type    = list(string)
  default = ["us-east-1", "us-east-2", "us-west-1", "us-west-2", "ap-south-1", "ap-northeast-2", "ap-southeast-1", "southeast-2", "ap-northeast-1", "ca-central-1", "eu-central-1", "eu-west-1", "eu-west-2", "eu-west-3", "sa-east-1"]

}
variable "astorage" {
  type    = number
  default = 10

}

variable "db_name" {
  default = null
  type    = string
}

variable "engine" {
  default = ["mysql"]
  type    = list(string)

}

variable "engine_version" {
  default = ["8.0.35"]
  type    = list(string)

}

variable "parameter_group_name" {
  default = "default.mysql8.0"
  type    = string

}

variable "skip_final_snapshot" {
  type    = bool
  default = "false"


}

variable "instance_class" {
  type    = list(string)
  default = ["db.t3.micro"]


}

variable "username" {
  default   = null
  sensitive = true

}

variable "password" {
  default   = null
  sensitive = true

}

