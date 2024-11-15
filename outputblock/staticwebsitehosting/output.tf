output "instance_ip" {
    value = aws_instance.photoprowess_instance.public_ip
}

output "instance_id" {
    value = aws_instance.photoprowess_instance.id
}

output "instance_domain_name" {
  value = aws_route53_record.photoprowess_dns_record.name
}
