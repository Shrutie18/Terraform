# variables.tf

# AWS Region (default: us-east-1)
variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

# EC2 Instance Type (default: t2.micro)
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

# AMI ID for Ubuntu (replace with your preferred AMI)
variable "ami_id" {
  description = "AMI ID to use for EC2 instance"
  default     = "ami-005fc0f236362e99f"  # Ubuntu AMI ID
}

# Key Name for EC2 access
variable "key_name" {
  description = "SSH key name to access EC2 instance"
  default     = "shruti1"
}

# Domain name for Route 53
variable "domain_name" {
  description = "Domain name for Route 53"
  default     = "shrutee.site"
}
