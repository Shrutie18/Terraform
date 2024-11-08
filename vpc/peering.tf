resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = module.vpc_one.vpc_id
  peer_vpc_id   = module.vpc_two.vpc_id
  peer_region   = "us-west-2"
  auto_accept   = false
  tags = {
    Name = "VPC-Peering-Connection"
  }
}

resource "aws_vpc_peering_connection_accepter" "peer_accept" {
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }
}
