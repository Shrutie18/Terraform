
provider "aws" {
   region = "us-east-1"
   profile = "shruti"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}