# Required Resource Variables
variable "ami" {}

variable "instance_type" {
    default = "t2.micro"
}

# Optional Resource Variables
variable "subnet_id" {}

variable "ebs_optimized" {
    default = false
}

variable "key_name" {}

variable "monitoring" {
    default = false
}

variable "vpc_security_group_ids" {
    default = []
}

variable "associate_public_ip_address" {
    default = false
}

variable "private_ip" {
    default = ""
}

variable "tags" {
    default = {}
}