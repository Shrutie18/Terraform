provider "aws" {
   region = "us-east-1"
   profile = "shruti"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}

terraform {

required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }
  }

backend "s3" {
	bucket = "cbzshruti" 
	key = "terraform.tfstate"
	region = "us-east-1"
  profile = "shruti"
}
}