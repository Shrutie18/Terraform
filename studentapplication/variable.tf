
variable "ubuntu_ami" {
  description = "AMI for Ubuntu instance"
  type        =  string
}

variable "aws_instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "key_name" {
  description = "Key pair name for EC2 instance"
  type        = string
}

