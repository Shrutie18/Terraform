provider "aws" {
   profile = "shruti"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}

resource "aws_instance" "this_aws_instance" {
    for_each = toset(var.imageid)
    ami = each.value
    #vpc_security_group_ids = ["sg-01c97071bf05b4c77"]
    #key_name = "shruti1"
    instance_type = "t3.micro"    
}   

resource "aws_iam_user" "main_user"{
    for_each = toset(var.main_user_name)
    name = each.value
}

variable "main_user_name" {
    type = list(string)
   
    default = ["ubuntu","awslinux","amazonlinux2"]
}

variable "imageid" {
    type = list(string)
    default = ["ami-0866a3c8686eaeeba","ami-05b1a50d6798f63cb","ami-064519b8c76274859"]

}

output "aws_ec2" {
  value = [
    for instance in var.imageid:
        aws_instance.this_aws_instance[instance].public_ip
  ]
}