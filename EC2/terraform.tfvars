region                   = "us-east-1"
instance_type            = "t2.micro"
ami_id                   = "ami-063d43db0594b521b"
new_security_group_name  = "example-sg"
existing_security_group_id = "sg-0299d0c8f8c6ca1f5"  # Replace with an actual security group ID
vpc_cidr                 = "10.0.0.0/16"
subnet_cidr              = "10.0.1.0/24"
