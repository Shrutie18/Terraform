# Specify the provider
provider "aws" {
  region = "ap-south-1"  # Change this to your preferred region
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

# Define subnets (example, replace with your actual VPC setup)
resource "aws_subnet" "public_a" {
  vpc_id            = "vpc-03947b27961859338" # Replace with your VPC ID
  cidr_block        = "172.31.0.0/16"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "public_b" {
  vpc_id            = "vpc-050618b63fcea7429"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
}
