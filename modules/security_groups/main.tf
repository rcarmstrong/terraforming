resource "aws_security_group" "security_group" {
  name   = "${var.name}"
  vpc_id = "${var.vpc_id}"

  tags = {
      Name = "${var.name}"
      Terraform = true
  }
}

resource "aws_security_group_rule" "allow_all_self" {
  type      = "ingress"
  from_port = 0
  to_port   = 65535
  protocol  = "tcp"
  self      = true

  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "allow_all_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.security_group.id}"
}
