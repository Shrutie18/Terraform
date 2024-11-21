variable "ami_id" {
  description = "The ID of the AMI to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "The instance type to use."
  type        = string
  default     = "t2.micro"
}

variable "security_group_ids" {
  description = "The security group IDs to associate with the instance."
  type        = list(string)
}

variable "instance_name" {
  description = "The name of the EC2 instance."
  type        = string
}
