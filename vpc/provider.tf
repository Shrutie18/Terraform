# configure aws provider
provider "aws" {
  region = var.region
}

# configure backend
terraform {
  backend "s3" {
    bucket         = "t2s-terraform"
    key            = "peering.terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamodb"
  }
}