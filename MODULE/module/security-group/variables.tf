variable "sg_name" {
  description = "The name of the security group."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created."
  type        = string
}

variable "sg_rules" {
  description = "List of security group rules."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
