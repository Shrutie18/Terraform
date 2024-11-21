
resource "aws_instance" "this_aws_instance" {
    for_each = toset(var.aws_ami)
    ami = each.value
    instance_type = "t3.medium"

    
} 

variable aws_ami {
       type = list(string)
       default = ["ami-012967cc5a8c9f891", "ami-0866a3c8686eaeeba", "ami-0166fe664262f664c" , "ami-0583d8c7a9c35822c" ]
}


output "aws_public_ip" {
    value = [for instance in var.aws_ami:
    aws_instance.this_aws_instance[instance].public_ip]
}