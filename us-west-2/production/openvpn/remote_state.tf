terraform {
  backend "s3" {
    bucket = "terraform.rarmstrong-sandbox.com"
    key    = "us-west-2/production/openvpn/terraform.tfstate"
    region = "us-west-2"
  }
}
