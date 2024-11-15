variable "this_aws_region" {
  description = "The variable is for aws region"
  type        = string
  default     = "us-east-1"
}

variable "this_vpc_cidr_block" {
  description = "The variable is for CIDR block for VPC"
  type        = string
  default     = "172.31.0.0/16"
}

variable "this_vpc_name" {
  description = "The variable is for VPC name"
  type        = string
  default     = "student-vpc"
}

variable "this_subnet_cidr_block" {
  description = "The variable is for CIDR block for the subnet"
  type        = string
  default     = "172.31.16.0/20"
}

variable "this_availability_zone" {
  description = "The variable is for Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "this_subnet_name" {
  description = "The variable is for Subnet name"
  type        = string
  default     = "student-subnet"
}

variable "this_internet_gateway_name" {
  description = "The variable is for Internet Gateway name"
  type        = string
  default     = "student-igw"
}

variable "this_security_group_name" {
  description = "The variable is for Security group name"
  type        = string
  default     = "student-sg"
}

variable "this_ami" {
  description = "The variable is for AMI ID for EC2 instance"
  type        = string
  default     = "ami-012967cc5a8c9f891"
}

variable "this_instance_type" {
  description = "The variable is for EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "this_associate_public_ip" {
  description = "Whether to associate a public IP with the EC2 instance"
  type        = bool
  default     = true
}

variable "this_instance_name" {
  description = "The variable is for Name of the instance"
  type        = string
  default     = "StudentApp"
}

variable "this_key_name" {
  description = "The variable is for Name of the SSH key pair"
  type        = string
  default     = "nverginia"
}