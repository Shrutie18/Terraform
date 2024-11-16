resource "aws_security_group" "sg-static" {
  name        = "sg-static"
  description = "Allow HTTP traffic for Static app"
  vpc_id      = var.vpc_id

# Create an EC2 instance
resource "aws_instance" "photoprowess_instance" {
  ami           = var.this_ami 
  instance_type = var.this_instance_type[0]              
  key_name      = var.this_key_pair          
  vpc_security_group_ids = [var.this_security_group]

  # Optional: Tagging the instance
  tags = var.this_tag
  associate_public_ip_address = var.this_associate_public_ip

 user_data = <<-EOF
 
#!/bin/bash

# Update package lists and install necessary packages
sudo apt update
sudo apt install -y unzip curl nginx

# Download the website template
curl -O https://www.free-css.com/assets/files/free-css-templates/download/page1/photoprowess.zip

# Extract into a new folder named 'photoprowess'
unzip photoprowess.zip -d photoprowess  

# Remove existing files from the web root
sudo rm -rf /var/www/html/*

# Move extracted files to the web root
sudo mv photoprowess/* /var/www/html/

# Clean up
sudo rm -rf photoprowess photoprowess.zip

# Enable and start Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

    EOF
}  

# Route 53 Hosted Zone (if you don’t already have it)
data "aws_route53_zone" "selected_zone" {
  name         = var.domain_name
  private_zone = false
}

# Route 53 DNS Record to bind the domain to the EC2 instance's public IP
resource "aws_route53_record" "photoprowess_dns_record" {
  zone_id = data.aws_route53_zone.selected_zone.zone_id
  name    = var.subdomain
  type    = "A"
  ttl     = 300
  records = [aws_instance.photoprowess_instance.public_ip]
}
