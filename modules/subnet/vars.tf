variable "vpc_id" {}

variable "cidr_blocks" {
    type = "list"
}

variable "name" {}

variable "availability_zones" {
    type = "list"
}

variable "zone_offset" {
    default = 0
}