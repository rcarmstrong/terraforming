variable "environment" {
  type = "map"
}

variable "aws_ami" {
  default = {
    "openvpn" = "ami-ffd74b87"
  }
}
