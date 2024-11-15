provider "aws" {
  region = var.this_aws_region
}

# Create VPC
resource "aws_vpc" "studentvpc" {
  cidr_block = var.this_vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags = {
    Name = var.this_vpc_name
  }
}

# Create Public Subnet in the VPC
resource "aws_subnet" "studentsubnet" {
  vpc_id            = aws_vpc.studentvpc.id
  cidr_block        = var.this_subnet_cidr_block
  availability_zone = var.this_availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = var.this_subnet_name
  }
}

# Create Internet Gateway for internet access
resource "aws_internet_gateway" "studentigw" {
  vpc_id = aws_vpc.studentvpc.id
  tags = {
    Name = var.this_internet_gateway_name
  }
}

# Create Route Table
resource "aws_route_table" "studentrt" {
  vpc_id = aws_vpc.studentvpc.id
  tags = {
    Name = "studentrt"
  }
}  

resource "aws_route" "publicroute" {
  route_table_id = aws_route_table.studentrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.studentigw.id
}
 
# Associate Route Table with Subnet
resource "aws_route_table_association" "studentsa" {
  subnet_id      = aws_subnet.studentsubnet.id
  route_table_id = aws_route_table.studentrt.id
}

# Create Security Group within the VPC
resource "aws_security_group" "studentsecuritygroup" {
  vpc_id = aws_vpc.studentvpc.id  # Ensure it is in the correct VPC

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

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.this_security_group_name
  }
}

# EC2 Instance Creation
resource "aws_instance" "StudentApp" {
  ami                          = var.this_ami
  instance_type                = var.this_instance_type
  associate_public_ip_address  = var.this_associate_public_ip
  subnet_id                    = aws_subnet.studentsubnet.id
  vpc_security_group_ids       = [aws_security_group.studentsecuritygroup.id]  # Use vpc_security_group_ids
  key_name                     = var.this_key_name 
  tags = {
    Name = var.this_instance_name
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install openjdk-11-jre-headless -y
              sudo apt install maven -y
              sudo apt install mariadb-client -y

              # Clone the repository
              git clone https://github.com/Aamantamboli/Studentapp.git /home/ubuntu/Studentapp

              # Navigate to the project directory and build it
              cd /home/ubuntu/Studentapp
              mvn clean package

              # Download and install Tomcat
              cd /tmp
              wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz
              tar -xvf apache-tomcat-9.0.97.tar.gz
              sudo mv apache-tomcat-9.0.97 /opt/tomcat

              # Set JAVA_HOME
              export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
              export CATALINA_HOME=/opt/tomcat

              # Copy the built artifacts to Tomcat's webapps directory
              sudo cp /home/ubuntu/Studentapp/target/*.war /opt/tomcat/webapps/
              sudo cp /home/ubuntu/Studentapp/*.jar /opt/tomcat/lib/

              # Start Tomcat
              sudo bash /opt/tomcat/bin/catalina.sh start
    EOF
}
