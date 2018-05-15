terraform {
  backend "s3" {
    bucket = "terraform.rarmstrong-sandbox.com"
    key    = "us-west-2/production/openvpn/terraform.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "terraform.rarmstrong-sandbox.com"
    key    = "us-west-2/production/vpc/terraform.tfstate"
    region = "us-west-2"
  }
}
