# Output the Public ip of the EC2 instance
output "public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.StudentApp.public_ip
}

# Output the Public DNS of the EC2 instance
output "public_dns" {
  value = aws_instance.StudentApp.public_dns
}
