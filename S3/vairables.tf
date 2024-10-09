variable "bucketname" {
  default = null

}

variable "days" {
  type    = list(string)
  default = ["30", "60", "90"]

}


variable "storage_class" {
  type    = list(string)
  default = ["STANDARD_IA", "GLACIER"]

}

