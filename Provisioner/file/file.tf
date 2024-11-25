provider "aws" {
    region = "us-west-1"
     profile = "configs"
}     


resource "aws_instance" "this_aws_instance" {
    ami = "ami-0da424eb883458071"
    vpc_security_group_ids = ["sg-0063c7dcb89f09c9b"]
    key_name = "navidali"
    instance_type = "t2.micro"
     
     provisioner "file" {
    source      = "readme.md"
    destination = "/home/ubuntu/readme.md"   #ubuntu  ami
     connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("${path.module}/navidali.pem") #navidlai privateip
    host     = "${self.public_ip}"
  }
  }
}  