provider "aws" {
  region = "ap-south-1"
  # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-04a37924ffe27da53"
  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  # Replace with your desired instance type

  tags = {
    Name = "SDM-TestTfStateinS3"
    # Assign a descriptive name to your EC2 instance
  }
}

terraform {
  backend "s3" {
    bucket         = "sdm-terraform-state-bucket-1"
    # Your S3 bucket name
    key            = "terraform.tfstate"
    # Name of your state file (if you prefer a different name)
    region         = "ap-south-1"
    # Replace with your desired region
    encrypt        = true
    dynamodb_table = "SDM-terraform-lock"
    # Optional: Enables state locking (if you configured DynamoDB)
  }
                                                      