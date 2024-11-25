
provider "aws" {
     
region = "us-east-1"
     profile = "shruti"
}


resource "aws_instance" "this_aws_instance" {
  ami = "ami-0453ec754f44f9a4a"
  vpc_security_group_ids = ["sg-01c97071bf05b4c77"]
  key_name = "shruti1"
  instance_type = "t2.micro"

  provisioner "remote-exec" {
    inline = [
      "sudo yum update",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user" # Default user for ec2-user AMIs; replace if needed
      private_key = file("${path.module}/shruti1.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "MyInstance"
  }
}

/*provisioner "remote-exec" {
  script = "path/to/script.sh"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("path/to/shruti1.pem")
    host        = self.public_ip
  }
}*/

 