provider "aws" {
    region = "us-east-1"
     profile = "shruti"
}     


resource "aws_instance" "this_aws_instance" {
    ami = "ami-0866a3c8686eaeeba"
    vpc_security_group_ids = ["sg-01c97071bf05b4c77"]
    key_name = "shruti1"
    instance_type = "t2.micro"
     
     provisioner "file" {
    source      = "readme.md"
    destination = "/home/ubuntu/readme.md"   #ubuntu  ami
     connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("${path.module}/shruti1.pem") #navidlai privateip
    host     = "${self.public_ip}"
  }
  }
}  
