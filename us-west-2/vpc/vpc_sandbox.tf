module "vpc_sandbox" {
  source = "../../modules/vpc"

  vpc_name       = "${format("%s sandbox", lookup(${var.environment, "region"}))}"
  vpc_cidr-block = "${var.vpc_cidr}"
}
