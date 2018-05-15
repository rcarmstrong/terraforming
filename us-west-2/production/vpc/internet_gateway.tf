module "internet_gateway" {
  source = "../../../modules/internet_gateway"

  vpc_id = "${module.vpc.vpc_id}"
}
