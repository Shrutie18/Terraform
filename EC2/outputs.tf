output "instance_id" {
  value       = aws_instance.example.id
  description = "The ID of the EC2 instance"
}

output "elastic_ip" {
  value       = aws_eip.example_eip.public_ip
  description = "The public IP address of the Elastic IP"
}

output "eni_id" {
  value       = aws_network_interface.example_eni.id
  description = "The ID of the Elastic Network Interface"
}

output "security_group_id" {
  value       = aws_security_group.new_sg.id
  description = "The ID of the new security group"
}
