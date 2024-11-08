# This file should only contain resource definitions, routes, etc.
# No module calls for vpc_one or vpc_two here.

resource "aws_vpc" "vpc_one" {
  cidr_block = var.vpc_one_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-one"
  }
}

resource "aws_vpc" "vpc_two" {
  cidr_block = var.vpc_two_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-two"
  }
}
