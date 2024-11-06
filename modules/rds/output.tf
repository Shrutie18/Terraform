output "rds_instance_endpoint" {
  value       = aws_db_instance.rds_instance.endpoint
  description = "The endpoint of the RDS instance"
}

output "rds_instance_id" {
  value       = aws_db_instance.rds_instance.id
  description = "The RDS instance ID"
}
