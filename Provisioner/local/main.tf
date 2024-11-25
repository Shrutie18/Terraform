
provider "aws" {
     
region = "us-east-1"
     profile = "shruti"
}


resource "aws_instance" "this_aws_instance" {
    ami = "ami-0453ec754f44f9a4a "
    vpc_security_group_ids = ["sg-01c97071bf05b4c77"]
    key_name = "shruti1"
    instance_type = "t2.micro"
   
   
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> /tmp/private_ips.txt "
  }
  provisioner "local-exec" {
    working_dir = "/tmp/"
    command = "echo ${self.private_ip} >> workingdir_private_ips.txt "
  }

}
