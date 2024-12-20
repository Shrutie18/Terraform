variable "this_image_id" {
  type        = string
  default = "ami-0866a3c8686eaeeba"
}

variable "this_disable_api_stop" {
  type        = bool
  default = false
}
variable "this_disable_api_termination" {
    type = bool 
    default = false
    description = "this variable is used to pass bool data to api_termination" 
}
variable "this_count" {
    type = number 
    default = 2
     
}
variable "this_vpc_security_group_ids" {
    type = string 
    default = "sg-01c97071bf05b4c77"
     
}

variable "this_list" {
    type = list 
    default = ["t2.micro" , "2" , "false"]
     
}

variable "this_map" {
    type = map  
    default = {
     purposeec2 = "webserver"   
     termination = true 
     count = 1

    }
     
}

#vpc variables starts from here 
variable "this_vpc_cidr_block" {
    type = string
    default = "172.31.0.0/16"
}
variable "this_vpc_tags" {
     type = string
     default = "this_vpc"
}
variable "this_subnet_pub_cidr_block" {
     type = string
     default = "172.31.16.0/20"
}

variable "this_subnet_pub_map_ip" {
    type = bool
    default = true
}
variable "this_subnet_pub_tags" {
    type = string
    default = "pub_subnet"
}