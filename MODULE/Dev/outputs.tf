output "instance_public_ip" {
  description = "The public IP of the EC2 instance."
  value       = module.ec2_instance.public_ip
}

output "security_group_id" {
  description = "The security group ID."
  value       = module.security_group.security_group_id
}
