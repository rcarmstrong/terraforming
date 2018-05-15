resource "aws_instance" "openvpn" {
  count                       = "${var.num_openvpn_instances}"
  ami                         = "${lookup(var.aws_ami, "openvpn")}"
  instance_type               = "t2.micro"
  key_name                    = "sandbox"
  subnet_id                   = "${element(data.terraform_remote_state.vpc.public_subnet_ids, count.index)}"
  vpc_security_group_ids      = ["${data.terraform_remote_state.vpc.public_sg_id}"]
  associate_public_ip_address = true

  tags = {
    Name      = "OpenVPN"
    Terraform = true
  }
}
