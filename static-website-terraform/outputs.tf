output "instance_public_ip" {
  value = aws_eip.web_eip.public_ip
  description = "Public IP of the EC2 instance"
}

output "website_url" {
  value = "http://www.${aws_route53_zone.main.name}"
  description = "Website URL"
}
