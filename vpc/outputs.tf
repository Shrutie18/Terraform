output "main_route_table_id_vpc_one" {
  value = module.vpc_one.route_table_ids[0]
}

output "vpc_cidr_vpc_one" {
  value = module.vpc_one.cidr_block
}

output "main_route_table_id_vpc_two" {
  value = module.vpc_two.route_table_ids[0]
}

output "vpc_cidr_vpc_two" {
  value = module.vpc_two.cidr_block
}
