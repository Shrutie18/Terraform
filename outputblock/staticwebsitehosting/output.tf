output "instance_ip" {
    value = aws_instance.fregg_instance.public_ip
}

output "instance_id" {
    value = aws_instance.fregg_instance.id
}

output "instance_domain_name" {
  value = aws_route53_record.fregg_dns_record.name
}