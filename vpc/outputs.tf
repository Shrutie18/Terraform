output "main_route_table_id_vpc_one" {
  value = module.vpc_one.main_route_table_id
}

output "vpc_cidr_vpc_one" {
  value = module.vpc_one.vpc_cidr
}

output "main_route_table_id_vpc_two" {
  value = module.vpc_two.main_route_table_id
}

output "vpc_cidr_vpc_two" {
  value = module.vpc_two.vpc_cidr
}
