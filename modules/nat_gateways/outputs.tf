output "elastic_ip_ids" {
  value = ["${aws_eip.elastic_ip.*.id}"]
}

output "nat_gateway_ids" {
  value = ["${aws_nat_gateway.nat_gw.*.id}"]
}