variable "ami_id" {
  description = "The AMI ID for the development environment."
  type        = string
  default     = "ami-0abcdef1234567890"
}

variable "vpc_id" {
  description = "The VPC ID for the development environment."
  type        = string
  default     = "vpc-0123456789abcdef"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance."
  type        = string
  default     = "t2.micro"
}
