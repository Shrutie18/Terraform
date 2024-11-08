output "main_route_table_id_vpc_one" {
  value = module.vpc_one.main_route_table_id
}

output "vpc_cidr_vpc_one" {
  value = module.vpc_one.cidr_block
}

output "main_route_table_id_vpc_two" {
  value = module.vpc_two.main_route_table_id
}

output "vpc_cidr_vpc_two" {
  value = module.vpc_two.cidr_block
}
