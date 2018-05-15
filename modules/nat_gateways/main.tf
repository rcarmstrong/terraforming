# Elastic IP
resource "aws_eip" "elastic_ip" {
  vpc   = true
  count = "${var.num_nat_gateways}"
}

# NAT gateway
resource "aws_nat_gateway" "nat_gw" {
  count         = "${var.num_nat_gateways}"
  allocation_id = "${element(aws_eip.elastic_ip.*.id, count.index)}"
  subnet_id     = "${element(var.subnet_ids, count.index)}"
}