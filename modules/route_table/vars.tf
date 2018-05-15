variable "vpc_id" {}

variable "name" {}

variable "internet_gateway_id" {
  default = ""
}

variable "nat_gateway_id" {
  default = ""
}

variable "num_subnets" {}

variable "subnets" {
  default = []
}

variable "availability_zones" {
  type = "list"
}
