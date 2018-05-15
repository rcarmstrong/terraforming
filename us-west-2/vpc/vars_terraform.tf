variable "environment" {
  type = "map"
}

variable "aws_ami" {
  default = {
    "openvpn" = "ami-e346559a"
  }
}

variable "vpc_cidr" {}

variable "public_subnet_cidrs" {
  type = "list"
}

variable "private_subnet_cidrs" {
  type = "list"
}
