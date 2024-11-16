# Security Group to allow HTTP access
resource "aws_security_group" "static_sg" {
  name        = "static-sg"
  description = "Allow HTTP traffic for Static app"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"
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

# EC2 Instance for the carint app
resource "aws_instance" "carint_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  # Correcting security group reference
  security_group_names = [aws_security_group.static_sg.id]

  # User data script to install Nginx and set up the app
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y unzip curl nginx
    curl -O https://www.free-css.com/assets/files/free-css-templates/download/page295/carint.zip
    unzip carint.zip -d /tmp
    rm -rf /var/www/html/*
    mv /tmp/carint-html/* /var/www/html/
    systemctl enable nginx
    systemctl start nginx
    EOF

  tags = {
    Name = "carint"
  }
}

# Route 53 Hosted Zone
data "aws_route53_zone" "selected_zone" {
  name         = var.domain_name
  private_zone = false
}

# Route 53 DNS Record
resource "aws_route53_record" "carint_dns_record" {
  zone_id = data.aws_route53_zone.selected_zone.zone_id
  name    = var.subdomain
  type    = "A"
  ttl     = 300
  records = [aws_instance.carint_instance.public_ip]
}
