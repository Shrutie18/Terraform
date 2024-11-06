provider "aws" {
  region = "us-west-2"
}

module "rds" {
  source                = "./modules/rds"
  db_name               = "mydatabase"
  username              = "admin"
  password              = "yourpassword"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  engine                = "mysql"
  engine_version        = "8.0"
  subnet_ids            = ["subnet-xxxxxx", "subnet-yyyyyy"] # Replace with your subnet IDs
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible   = false
}

resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow MySQL traffic to RDS"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["your_ip_or_vpc_cidr"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
