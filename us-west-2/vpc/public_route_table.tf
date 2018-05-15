module "public_routetable" {
  source = "../../modules/route_table"

  vpc_id              = "${module.vpc_sandbox.vpc_id}"
  name                = "Public Gateway"
  internet_gateway_id = "${module.internet_gateway.internet_gw_id}"
  availability_zones  = "${split(",", data.null_data_source.availability_zones.inputs.names)}"

  # XXX - https://serialseb.com/blog/2016/05/11/terraform-working-around-no-count-on-module/
  num_subnets = "${data.null_data_source.availability_zones.inputs.count}"
  subnets     = ["${module.public_subnets.ids}"]
}
