variable "offset" {
  default = 0
}

data "null_data_source" "initial_cluster" {
  inputs = {
    names = "${join(",", formatlist("zetcd-%s=http://%s:2380", list("0","1","2"), var.zetcd_ips))}"
  }
}

data "template_file" "etcd_dropin" {
  count = "${length(var.zetcd_ips)}"
  template = "${file("resources/etcd-member-conf.tpl")}"

  vars {
    name = "${format("zetcd-%d", count.index + var.offset)}"
    cluster_list = "${data.null_data_source.initial_cluster.inputs.names}"
    cluster_state = "new"
  }
}

data "ignition_systemd_unit" "etcd_cluster" {
  count = "${length(var.zetcd_ips)}"
  name = "etcd-member.service"
  dropin = {
    name = "20-clct-etcd-member.conf"
    content = "${element(data.template_file.etcd_dropin.*.rendered, count.index + var.offset)}"
  }
}

data "ignition_config" "zetcd_config" {
  count = "${length(var.zetcd_ips)}"
  systemd = ["${element(data.ignition_systemd_unit.etcd_cluster.*.id, count.index + var.offset)}"]
}

resource "aws_instance" "zetcd" {
  count = "${length(var.zetcd_ips)}"

  ami = "${lookup(var.aws_ami, "coreos")}"

  instance_type = "t2.micro"

  key_name = "sandbox"

  security_groups = ["${module.private_zone.id}"]

  subnet_id = "${element(module.private_subnets.ids, count.index + var.offset)}"

  private_ip = "${element(var.zetcd_ips,count.index + var.offset)}"

  user_data = "${element(data.ignition_config.zetcd_config.*.rendered, count.index + var.offset)}"

  tags = {
    Name      = "zetcd-${count.index + var.offset}"
    Terraform = "true"
  }
}
