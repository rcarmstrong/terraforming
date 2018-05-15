module "public_subnets" {
  source = "../../modules/subnet"

  vpc_id             = "${module.vpc_sandbox.vpc_id}"
  cidr_blocks        = "${var.public_subnet_cidrs}"
  name               = "Public Zone"
  availability_zones = "${split(",", data.null_data_source.availability_zones.inputs.names)}"
}
