resource "aws_route" "route_to_peer_vpc_one" {
  route_table_id            = module.vpc_one.main_route_table_id
  destination_cidr_block    = module.vpc_two.cidr_block
}

resource "aws_route" "route_to_peer_vpc_two" {
  route_table_id            = module.vpc_two.main_route_table_id
  destination_cidr_block    = module.vpc_one.cidr_block
}