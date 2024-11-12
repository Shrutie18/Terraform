# outputs.tf

output "instance_ip" {
  description = "Public IP address of the web server"
  value       = aws_eip.static_ip.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web_server.id
}
