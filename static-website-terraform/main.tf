provider "aws" {
  region = "us-east-1" # Replace with your preferred region
}

# Elastic IP for Static IP
resource "aws_eip" "web_eip" {
  instance = aws_instance.web_instance.id
}

# Security Group allowing HTTP
resource "aws_security_group" "web_sg" {
  name   = "web-sg"

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

# EC2 Instance for the Website
resource "aws_instance" "web_instance" {
  ami           = "ami-0866a3c8686eaeeba"  # Replace with your region-specific AMI
  instance_type = "t2.micro"
  key_name      = var.key_name
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "Static-Website-Host"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "echo '<h1>Welcome to My Static Website</h1>' | sudo tee /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}
# Create a Route 53 Hosted Zone
resource "aws_route53_zone" "main" {
  name = "shrutee.site" # Replace with your domain name
}

# Create an A record pointing to the Elastic IP
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www"
  type    = "A"
  ttl     = 300
  records = [aws_eip.web_eip.public_ip]
}

