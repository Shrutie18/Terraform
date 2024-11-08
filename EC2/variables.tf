variable "region" {
  description = "The AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"  # Example for Amazon Linux 2
}

variable "new_security_group_name" {
  description = "Name of the new security group"
  default     = "my-new-security-group"
}

variable "existing_security_group_id" {
  description = "ID of the existing security group"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}
