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

output "main_route_table_id_vpc_one" {
  value = module.vpc_one.route_table_ids[0]  # Example of how to get a route table ID
}

output "vpc_cidr_vpc_one" {
  value = module.vpc_one.cidr_block  # Example of how to get the VPC CIDR
}

output "main_route_table_id_vpc_two" {
  value = module.vpc_two.route_table_ids[0]  # Example of how to get a route table ID
}

output "vpc_cidr_vpc_two" {
  value = module.vpc_two.cidr_block  # Example of how to get the VPC CIDR
}
