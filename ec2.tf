resource "aws_instance" "this_is_ubuntu" {

    ami = "ami-0e0e417dfa2028266" 
    disable_api_stop  = false 
    disable_api_termination = false  
    instance_type = "t2.micro" 
    key_name= "shrutikey"
    vpc_security_group_ids = ["sg-08e875220cb8c5d83"]
    count = 4  #loop 
    tags = {
      purpose = "webserver"
    } 
    

}    