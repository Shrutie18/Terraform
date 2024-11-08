module "vpc_one" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "vpc-one"
  cidr   = var.vpc_one_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
}

module "vpc_two" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "vpc-two"
  cidr   = var.vpc_two_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
}
