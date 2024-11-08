# Creating T2S VPC Dev
resource "aws_vpc" "t2s-vpc-dev" {
  cidr_block = var.t2s-vpc-dev-cidr

  tags = {
    Name = "t2s-vpc-dev"
  }
}

# Creating T2S VPC Stage
resource "aws_vpc" "t2s-vpc-stage" {
  cidr_block = var.t2s-vpc-stage-cidr

  tags = {
    Name = "t2s-vpc-stage"
  }
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

# Creating Subnet Dev in T2S VPC Dev
resource "aws_subnet" "subnet-dev" {
  vpc_id            = aws_vpc.t2s-vpc-dev.id
  cidr_block        = var.subnet-dev-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags = {
    Name = "Dev-Subnet"
  }
}

# Creating Subnet Stage in T2S VPC Stage
resource "aws_subnet" "subnet-stage" {
  vpc_id            = aws_vpc.t2s-vpc-stage.id
  cidr_block        = var.subnet-stage-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]

  tags = {
    Name = "Stage-Subnet"
  }
}

# Creating and Configuring the Peering connection.
resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id      = aws_vpc.t2s-vpc-dev.id
  peer_vpc_id = aws_vpc.t2s-vpc-stage.id
}

resource "aws_vpc_peering_connection_accepter" "vpc_peering_accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  auto_accept               = true
}