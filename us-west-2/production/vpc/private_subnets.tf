module "private_subnets" {
  source = "../../../modules/subnet"

  vpc_id             = "${module.vpc.vpc_id}"
  cidr_blocks        = "${var.private_subnet_cidrs}"
  name               = "Private Zone"
  availability_zones = "${split(",", data.null_data_source.availability_zones.inputs.names)}"
}
