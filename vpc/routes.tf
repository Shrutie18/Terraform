resource "aws_route" "route_to_peer_vpc_one" {
  route_table_id            = module.vpc_one.route_table_ids[0]  # Correct reference for route table ID
  destination_cidr_block    = module.vpc_two.cidr_block  # Correct reference for VPC CIDR
}

resource "aws_route" "route_to_peer_vpc_two" {
  route_table_id            = module.vpc_two.route_table_ids[0]  # Correct reference for route table ID
  destination_cidr_block    = module.vpc_one.cidr_block  # Correct reference for VPC CIDR
}
