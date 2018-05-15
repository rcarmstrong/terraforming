variable "aws_ami" {
  default = {
    "coreos" = "ami-82bd41fa"
  }
}

variable "zetcd_ips" {
  type = "list"
}

variable "private_subnet_cidrs" {
  type = "list"
}
