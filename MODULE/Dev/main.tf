module "security_group" {
  source = "../modules/security_group"

  sg_name  = "dev-sg"
  vpc_id   = "vpc-0123456789abcdef" # Replace with your Dev VPC ID
  sg_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "ec2_instance" {
  source            = "../modules/ec2"

  ami_id            = "ami-0abcdef1234567890" # Replace with your Dev AMI ID
  instance_type     = "t2.micro"
  security_group_ids = [module.security_group.security_group_id]
  instance_name     = "DevEC2Instance"
}
