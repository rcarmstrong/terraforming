# terraform {
#   backend "s3" {
#     bucket = "terraform.rarmstrong-sandbox.com"
#     key    = "us-west-2/production/vpc/terraform.tfstate"
#     region = "us-west-2"
#   }
# }

terraform {
  backend "local" {
    path = "../state/vpc/terraform.tfstate"
  }
}
