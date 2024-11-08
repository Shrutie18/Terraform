provider "aws" {
  region = "us-west-2"
}

module "vpc_one" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "vpc-one"
  cidr   = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

module "vpc_two" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "vpc-two"
  cidr   = "10.1.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}
