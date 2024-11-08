variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-west-2"
}

variable "vpc_one_cidr" {
  description = "CIDR block for VPC one"
  default     = "10.0.0.0/16"
}

variable "vpc_two_cidr" {
  description = "CIDR block for VPC two"
  default     = "10.1.0.0/16"
}
