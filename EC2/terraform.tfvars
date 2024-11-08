region                   = "us-east-1"
instance_type            = "t2.micro"
ami_id                   = "ami-0c55b159cbfafe1f0"
new_security_group_name  = "example-sg"
existing_security_group_id = "sg-0123456789abcdef"  # Replace with an actual security group ID
vpc_cidr                 = "10.0.0.0/16"
subnet_cidr              = "10.0.1.0/24"
