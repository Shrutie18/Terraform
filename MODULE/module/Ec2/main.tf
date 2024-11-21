resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Attach security groups
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = var.instance_name
  }
}

output "instance_id" {
  value = aws_instance.example.id
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
