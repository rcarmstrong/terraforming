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

output "openvpn_ssh_command" {
  value = "${format("ssh -i ~/.ssh/%s.pem openvpnas@%s", aws_instance.openvpn.key_name, aws_instance.openvpn.public_ip)}"
}
