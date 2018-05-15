module "internet_gateway" {
  source = "../../modules/internet_gateway"

  vpc_id = "${module.vpc_sandbox.vpc_id}"
}
