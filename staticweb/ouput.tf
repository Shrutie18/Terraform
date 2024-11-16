
output "instance_domain_name" {
  value = aws_route53_record.carint_dns_record.name
}