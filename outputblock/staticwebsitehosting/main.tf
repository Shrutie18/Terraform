# Specify the provider (AWS)
provider "aws" {
  region = var.this_aws_region
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = var.this_ami 
  instance_type = var.this_instance_type[0]              
  key_name      = var.this_key_pair          
  vpc_security_group_ids = [var.this_security_group]

  # Optional: Tagging the instance
  tags = var.this_tag
  
  # Optional: Associate a public IP with the instance (for public access)
  associate_public_ip_address = var.this_associate_public_ip

   user_data = <<-EOF
    #!/bin/bash
    sudo apt install unzip -y curl
    sudo apt install nginx -y
    curl -O https://www.free-css.com/assets/files/free-css-templates/download/page290/fregg.zip
    sudo unzip fregg.zip
    sudo rm -rf /var/www/html/*
    sudo mv fregg-html/* /var/www/html/
    sudo systemctl enable nginx
    sudo systemctl start nginx
    EOF
}  

data "aws_route53_zone" "primary" {
  zone_id = "Z0021523DMNZEF2TZSZE
"
}

#Create a record
resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "@"
  type    = "A"
  ttl     =  300
  records = [aws_instance.example.public_ip]
}
