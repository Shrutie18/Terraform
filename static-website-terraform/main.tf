# main.tf

# AWS Provider Configuration
provider "aws" {
  region = var.region
}

# Security Group: Allow HTTP and SSH traffic
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP and SSH"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance Configuration
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = [aws_security_group.web_sg.name]

  # User data to install Apache web server and serve a simple page
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              echo "Hello, world from EC2" > /var/www/html/index.html
              systemctl enable apache2
              systemctl start apache2
              EOF

  tags = {
    Name = "StaticWebsiteInstance"
  }
}

# Elastic IP for static IP address
resource "aws_eip" "static_ip" {
  instance = aws_instance.web_server.id
}

# Route 53 Hosted Zone
resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

# Route 53 DNS Record to bind domain to EC2 instance's Elastic IP
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.id
  name    = "www.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_eip.static_ip.public_ip]
}

