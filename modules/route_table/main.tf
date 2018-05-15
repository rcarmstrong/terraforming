resource "aws_route_table" "table" {
  vpc_id = "${var.vpc_id}"

  route = {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = "${length(var.internet_gateway_id) > 0 ? var.internet_gateway_id : ""}"
    nat_gateway_id = "${length(var.nat_gateway_id) > 0 ? var.nat_gateway_id : ""}"
  }

  tags {
    Name      = "${var.name}"
    Terraform = "true"
  }
}

resource "aws_route_table_association" "subnet" {
  count          = "${var.num_subnets}"
  subnet_id      = "${element(var.subnets, count.index)}"
  route_table_id = "${aws_route_table.table.id}"
}
