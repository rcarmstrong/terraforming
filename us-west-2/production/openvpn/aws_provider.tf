provider "aws" {
  region = "${lookup(var.environment, "region", "us-west-2")}"
}

data "aws_availability_zones" "available" {}

data "null_data_source" "az_calc" {
  inputs = {
    names = "${length(data.aws_availability_zones.available.names) > 3 ? join(",", slice(data.aws_availability_zones.available.names, 0, 3)) : join(",", data.aws_availability_zones.available.names)}"
  }
}

data "null_data_source" "availability_zones" {
  inputs = {
    count = "${length(split(",", data.null_data_source.az_calc.inputs.names))}"
    names = "${data.null_data_source.az_calc.inputs.names}"
  }
}
