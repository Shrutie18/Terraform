output "vpc_one_peering_connection_id" {
  value = aws_vpc_peering_connection.peer.id
}

output "vpc_two_peering_connection_id" {
  value = aws_vpc_peering_connection.peer.id
}
output "main_route_table_id" {
  value = aws_vpc.main_route_table_id
}

output "vpc_cidr" {
  value = aws_vpc.cidr_block
}

