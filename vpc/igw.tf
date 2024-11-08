# Creating internet gateway
resource "aws_internet_gateway" "t2s-igw" {
  vpc_id = aws_vpc.t2s-vpc-dev.id
}

# Associate internet gateway with VPC Dev's Route Table
resource "aws_route" "route_to_internet" {
  route_table_id         = aws_route_table.route-table-dev.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.t2s-igw.id
}