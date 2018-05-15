variable "environment" {
  type = "map"
}

variable "aws_ami" {
  default = {
    "openvpn" = "ami-ffd74b87"
  }
}

variable "num_openvpn_instances" {}
