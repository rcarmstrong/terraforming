variable "vpc_conf" {
  type = "map"
}

variable "aws_ami" {
  default = {
    "openvpn" = "ami-e346559a"
  }
}

variable "public_subnet_cidrs" {
  type = "list"
}

variable "private_subnet_cidrs" {
  type = "list"
}
