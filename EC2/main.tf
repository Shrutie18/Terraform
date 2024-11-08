# Create a new VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "example-vpc"
  }
}

# Create a new subnet in the VPC
resource "aws_subnet" "example_subnet" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-east-1a"  # Adjust as necessary
}

# Create a new security group
resource "aws_security_group" "new_sg" {
  name_prefix = var.new_security_group_name
  vpc_id      = aws_vpc.example_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an Elastic Network Interface (ENI)
resource "aws_network_interface" "example_eni" {
  subnet_id       = aws_subnet.example_subnet.id
  security_groups = [aws_security_group.new_sg.id, var.existing_security_group_id]
}

# Allocate an Elastic IP
resource "aws_eip" "example_eip" {
  instance = aws_instance.example.id
}

# Attach the ENI to an EC2 instance
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  network_interface {
    network_interface_id = aws_network_interface.example_eni.id
    device_index         = 0
  }

  tags = {
    Name = "example-instance"
  }
}
# Internet Gateway
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id
  tags = {
    Name = "example-igw"
  }
}

# Route Table
resource "aws_route_table" "example_route_table" {
  vpc_id = aws_vpc.example_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
  }

  tags = {
    Name = "example-route-table"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "example_association" {
  subnet_id      = aws_subnet.example_subnet.id
  route_table_id = aws_route_table.example_route_table.id
}



