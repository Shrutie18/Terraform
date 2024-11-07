# Specify the provider
provider "aws" {
  region = "us-east-1"  # Change this to your preferred region
}

# Create a security group for the RDS instance
resource "aws_security_group" "rds_sg" {
  name        = "rds-oracle-sg"
  description = "Allow inbound traffic for Oracle RDS"

  ingress {
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change this to restrict access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create the RDS Oracle instance
resource "aws_db_instance" "oracle_rds" {
  allocated_storage    = 20                     # Storage in GB
  engine               = "oracle-se2"           # Oracle Standard Edition 2
  engine_version       = "19.0.0.0.ru-2023-07.rur-2023-07.r1" # Specify the version
  instance_class       = "db.t3.medium"         # Instance type
  identifier           = "my-oracle-db"         # Unique name for the RDS instance
  username             = "admin"                # Master username
  password             = "password123"          # Master password (change for security)
  publicly_accessible  = true                   # Make publicly accessible if required
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet.id
  skip_final_snapshot  = true                   # Avoid snapshot on deletion
}

# Create a DB subnet group
resource "aws_db_subnet_group" "rds_subnet" {
  name       = "rds-oracle-subnet"
  subnet_ids = ["subnet-011b4dccabc332923","subnet-03944221db16b54cc" ]  # Replace with your subnet IDs
  description = "RDS subnet group"
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-b"
  }
}
