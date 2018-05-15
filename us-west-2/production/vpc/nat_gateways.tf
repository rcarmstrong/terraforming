module "nat_gateways" {
  source = "../../../modules/nat_gateways"

  num_nat_gateways = "${data.null_data_source.availability_zones.inputs.count}"
  subnet_ids       = ["${module.public_subnets.ids}"]
}
