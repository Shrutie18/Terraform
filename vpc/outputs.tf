output "vpc_one_peering_connection_id" {
  value = aws_vpc_peering_connection.peer.id
}

output "vpc_two_peering_connection_id" {
  value = aws_vpc_peering_connection.peer.id
}
