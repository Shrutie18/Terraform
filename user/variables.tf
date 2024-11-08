variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"  # Default value, can be overridden in terraform.tfvars
}

variable "user_name" {
  description = "Name of the IAM user"
}

variable "group_name" {
  description = "Name of the IAM group"
}

variable "user_policy_arn" {
  description = "Policy to attach to the IAM user"
  default     = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

variable "group_policy_arn" {
  description = "Policy to attach to the IAM group"
  default     = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}
