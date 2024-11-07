provider "aws" {
   profile = "config"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}
provider "aws" {
  alias  = "east"
  region = "us-east-1"  # Use this for resources in us-east-1
}
