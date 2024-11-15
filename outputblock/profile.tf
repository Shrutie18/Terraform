provider "aws" {
   profile = "shruti"
   region  = "us-east-1"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}