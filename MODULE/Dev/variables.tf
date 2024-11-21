variable "ami_id" {
  description = "The AMI ID for the development environment."
  type        = string
  default     = "ami-012967cc5a8c9f891"
}

variable "vpc_id" {
  description = "The VPC ID for the development environment."
  type        = string
  default     = "vpc-0b4af15ede36e3430"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance."
  type        = string
  default     = "t2.micro"
}
