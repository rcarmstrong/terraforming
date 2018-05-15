provider "aws" {
  region = "us-west-2"
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

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "terraform.rarmstrong-sandbox.com"
    key    = "us-west-2/vpc/terraform.tfstate"
    region = "us-west-2"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform.rarmstrong-sandbox.com"
    key    = "us-west-2/prod/terraform.tfstate"
    region = "us-west-2"
  }
}
