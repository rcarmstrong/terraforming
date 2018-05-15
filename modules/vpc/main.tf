resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc_cidr-block}"

    enable_dns_hostnames = true

    tags = {
        Name = "${var.vpc_name}"
        Terraform = true
    }
}