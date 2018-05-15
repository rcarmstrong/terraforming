module "private_routetable_az_1" {
  source = "../../modules/route_table"

  vpc_id             = "${module.vpc_sandbox.vpc_id}"
  name               = "${format("NAT to Public Gateway - %s", element(split(",", data.null_data_source.availability_zones.inputs.names), 0))}"
  nat_gateway_id     = "${module.nat_gateways.nat_gateway_ids[0]}"
  availability_zones = "${split(",", data.null_data_source.availability_zones.inputs.names)}"

  # XXX - https://serialseb.com/blog/2016/05/11/terraform-working-around-no-count-on-module/
  num_subnets = "1"
  subnets     = ["${module.private_subnets.ids[0]}"]
}

module "private_routetable_az_2" {
  source = "../../modules/route_table"

  vpc_id             = "${module.vpc_sandbox.vpc_id}"
  name               = "${format("NAT to Public Gateway - %s", element(split(",", data.null_data_source.availability_zones.inputs.names), 1))}"
  nat_gateway_id     = "${module.nat_gateways.nat_gateway_ids[1]}"
  availability_zones = "${split(",", data.null_data_source.availability_zones.inputs.names)}"

  # XXX - https://serialseb.com/blog/2016/05/11/terraform-working-around-no-count-on-module/
  num_subnets = "1"
  subnets     = ["${module.private_subnets.ids[1]}"]
}

module "private_routetable_az_3" {
  source = "../../modules/route_table"

  vpc_id             = "${module.vpc_sandbox.vpc_id}"
  name               = "${format("NAT to Public Gateway - %s", element(split(",", data.null_data_source.availability_zones.inputs.names), 2))}"
  nat_gateway_id     = "${module.nat_gateways.nat_gateway_ids[2]}"
  availability_zones = "${split(",", data.null_data_source.availability_zones.inputs.names)}"

  # XXX - https://serialseb.com/blog/2016/05/11/terraform-working-around-no-count-on-module/
  num_subnets = "1"
  subnets     = ["${module.private_subnets.ids[2]}"]
}
