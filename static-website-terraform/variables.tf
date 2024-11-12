variable "region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string
}
