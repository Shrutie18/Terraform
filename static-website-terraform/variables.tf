variable "key_name" {
  description = "Name of the EC2 Key Pair"
}

variable "private_key_path" {
  description = "Path to the private key file"
  default     = "/home/ubuntu/.ssh"
}
