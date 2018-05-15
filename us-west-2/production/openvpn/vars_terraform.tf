variable "environment" {
  type = "map"
}

variable "aws_ami" {
  default = {
    "openvpn" = "ami-e346559a"
  }
}
