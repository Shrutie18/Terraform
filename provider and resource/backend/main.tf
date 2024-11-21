provider "aws" {
      region = "us-east-1"
      profile = "shruti"
      shared_credentials_files = ["/home/anup/.aws/credentials"]
    
}

#LockID
terraform {
    backend "s3" {
        bucket = "Cloudblitz123"
        key = "terraform.tfstate"
        dynamodb_table = "cbz38"
        region = "us-east-1"
        profile = "shruti"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
    }
}


resource "aws_instance" "ths_instance" {
  ami = "ami-012967cc5a8c9f891"
  //key_name = "shruti1"
  instance_type = "t2.micro"
  //security_groups = ["sg-01c97071bf05b4c77"]
  count = 1
  
  
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo echo "hello world this is Batc38" >> /var/www/html/index.html
    EOF
   tags = {
    Name = "first_terraform_instance"

  } 
    
}