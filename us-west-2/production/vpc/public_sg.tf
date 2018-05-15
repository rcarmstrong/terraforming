module "public_sg" {
  source = "../../../modules/security_groups"

  vpc_id = "${module.vpc.vpc_id}"
  name   = "public_sg"
}

resource "aws_security_group_rule" "public_allow_ssh" {
  type = "ingress"

  from_port = 22
  to_port   = 22
  protocol  = "tcp"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${module.public_sg.id}"
}

resource "aws_security_group_rule" "allow_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${module.public_sg.id}"
}

resource "aws_security_group_rule" "allow_openvpn_ui" {
  type        = "ingress"
  from_port   = 943
  to_port     = 943
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${module.public_sg.id}"
}

resource "aws_security_group_rule" "allow_openvpn_udp" {
  type        = "ingress"
  from_port   = 1194
  to_port     = 1194
  protocol    = "udp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${module.public_sg.id}"
}

resource "aws_security_group_rule" "allow_all_icmp" {
  type        = "ingress"
  from_port   = 8
  to_port     = 0
  protocol    = "icmp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${module.public_sg.id}"
}
