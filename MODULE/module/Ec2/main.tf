resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Attach security groups
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = var.instance_name
  }
}

