resource "aws_instance" "ubuntu_box" {

    ami = "${var.ami}"

    instance_type = "${var.instance_type}"

    subnet_id = "${var.subnet_id}"

    key_name = "${var.key_name}"

    vpc_security_group_ids = ["${var.vpc_security_group_ids}"]

    associate_public_ip_address = "${var.associate_public_ip_address}"

    private_ip = "${var.private_ip}"

    ebs_optimized = "${var.ebs_optimized}"

    monitoring = "${var.monitoring}"

    tags = "${var.tags}"

}