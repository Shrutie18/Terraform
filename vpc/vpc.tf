module "vpc_one" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = "vpc-one"
  cidr               = var.vpc_one_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
}

module "vpc_two" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = "vpc-two"
  cidr               = var.vpc_two_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Add the following outputs for the attributes you want to access
output "vpc_one_main_route_table_id" {
  value = module.vpc_one.main_route_table_id
}

output "vpc_one_cidr" {
  value = module.vpc_one.vpc_cidr
}

output "vpc_two_main_route_table_id" {
  value = module.vpc_two.main_route_table_id
}

output "vpc_two_cidr" {
  value = module.vpc_two.vpc_cidr
}
