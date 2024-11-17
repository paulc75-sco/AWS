variable "region" {
  default = "us-east-1"
}


variable "name" {
  default = "DEMO_TABLE"

}

variable "billing_mode" {
  default = "PROVISIONED"

}

variable "read_capacity" {
  default = 10

}

variable "write_capacity" {
  default = 10

}

variable "hash_key" {
  default = "DEMO_HASH"

}

variable "range_key" {
  default = "DEMO_RANGE"

}

variable "si_write_capacity" {
  default = 10

}

variable "si_read_capacity" {
  default = 10

}

variable "projection_type" {
  default = "INCLUDE"
}

variable "si_name" {
  default = "DEMO_SECONDARY_INDEX"

}
