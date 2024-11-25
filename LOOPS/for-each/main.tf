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
    instance_type = "t2.micro"    
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
    default = ["ami-0453ec754f44f9a4a","ami-0166fe664262f664c","ami-0866a3c8686eaeeba"]

}

output "aws_ec2" {
  value = [
    for instance in var.imageid:
        aws_instance.this_aws_instance[instance].public_ip
  ]
}