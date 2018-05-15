module "vpc" {
  source = "../../../modules/vpc"

  vpc_name       = "${lookup(var.vpc_conf, "name")}"
  vpc_cidr-block = "${lookup(var.vpc_conf, "cidr")}"
}
