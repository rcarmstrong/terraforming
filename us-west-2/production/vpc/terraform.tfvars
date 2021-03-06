environment = {
  region = "us-west-2"
}

vpc_conf = {
  name   = "production-env-sandbox"
  cidr   = "192.168.0.0/16"
  region = "us-west-2"
}

public_subnet_cidrs = ["192.168.0.0/26", "192.168.0.64/26", "192.168.0.128/26"]

private_subnet_cidrs = ["192.168.1.0/26", "192.168.1.64/26", "192.168.1.128/26"]
