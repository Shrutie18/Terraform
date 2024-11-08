# Creating Route tables
resource "aws_route_table" "route-table-dev" {
  vpc_id = aws_vpc.t2s-vpc-dev.id
}

resource "aws_route_table" "route-table-stage" {
  vpc_id = aws_vpc.t2s-vpc-stage.id
}

# Creating Routes in Route Tables for VPC Peering
resource "aws_route" "t2s-route-dev" {
  route_table_id            = aws_route_table.route-table-dev.id
  destination_cidr_block    = aws_vpc.t2s-vpc-stage.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

resource "aws_route" "t2s-route-stage" {
  route_table_id            = aws_route_table.route-table-stage.id
  destination_cidr_block    = aws_vpc.t2s-vpc-dev.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}