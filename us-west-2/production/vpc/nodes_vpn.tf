resource "aws_instance" "openvpn" {
  ami                         = "${lookup(var.aws_ami, "openvpn")}"
  instance_type               = "t2.micro"
  key_name                    = "sandbox"
  subnet_id                   = "${element(module.public_subnets.ids, 0)}"
  vpc_security_group_ids      = ["${module.public_sg.id}"]
  associate_public_ip_address = true

  tags = {
    Name      = "OpenVPN"
    Terraform = true
  }
}
