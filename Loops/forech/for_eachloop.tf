
resource "aws_instance" "this_aws_instance" {
    for_each = toset(var.aws_ami)
    ami = each.value
    instance_type = "t3.medium"

    
} 

variable aws_ami {
       type = list(string)
       default = ["ami-0453ec754f44f9a4a", "ami-0583d8c7a9c35822c", "ami-05b1a50d6798f63cb"]
}


output "aws_public_ip" {
    value = [for instance in var.aws_ami:
    aws_instance.this_aws_instance[instance].public_ip]
}