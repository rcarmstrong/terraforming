resource "aws_subnet" "subnet" {
  count = "${length(var.cidr_blocks)}"

  vpc_id            = "${var.vpc_id}"
  availability_zone = "${element(var.availability_zones, count.index + var.zone_offset)}"
  cidr_block        = "${element(var.cidr_blocks, count.index)}"

  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags = {
    Name      = "${format("%s - %s", var.name, element(var.availability_zones, count.index + var.zone_offset))}"
    Terraform = true
  }
}
