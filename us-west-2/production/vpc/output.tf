output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "public_subnet_ids" {
  value = "${module.public_subnets.ids}"
}

output "public_sg_id" {
  value = "${module.public_sg.id}"
}

output "nat_gateway_ids" {
  value = "${module.nat_gateways.nat_gateway_ids}"
}
