# Create an Internet gateway
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name      = "Internet Gateway"
    Terraform = "true"
  }
}
