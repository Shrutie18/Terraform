module "security_group" {
  source = "/home/cloudshell-user/Terraform/MODULE/module/security-group"

  sg_name  = "dev-sg"
  vpc_id   = "vpc-0b4af15ede36e3430" # Replace with your Dev VPC ID
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
  source            = "/home/cloudshell-user/Terraform/MODULE/module/Ec2"

  ami_id            = "ami-012967cc5a8c9f891" # Replace with your Dev AMI ID
  instance_type     = "t2.micro"
  security_group_ids = [module.security_group.security_group_id]
  instance_name     = "DevEC2Instance"
}
