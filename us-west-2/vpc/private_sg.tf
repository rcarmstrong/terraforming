module "private_sg" {
  source = "../../modules/security_groups"

  vpc_id = "${module.vpc_sandbox.vpc_id}"
  name   = "private_sg"
}

resource "aws_security_group_rule" "private_allow_ssh" {
  type = "ingress"

  from_port = 22
  to_port   = 22
  protocol  = "tcp"

  source_security_group_id = "${module.public_sg.sg_id}"
  security_group_id        = "${module.private_sg.id}"
}

resource "aws_security_group_rule" "private_allow_ping" {
  type = "ingress"

  from_port   = 8
  to_port     = 0
  protocol    = "icmp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${module.private_sg.id}"
}
