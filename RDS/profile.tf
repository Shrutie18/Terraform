provider "aws" {
   profile = "config"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}