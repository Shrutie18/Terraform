variable "this_ami" {
    type = string
    default = "ami-005fc0f236362e99f"
    description = "This variable is for aws ami"
}

variable "this_instance_type" {
    type = list
    default = ["t2.micro" , "t3.small" , "t3.large"]
    description = "This variable is for aws instance type"
}

variable "this_key_pair" {
    type = string
    default = "nvirginia"
    description = "This variable is for aws key pair"
}

variable "this_associate_public_ip" {
    type = bool
    default = true 
    description = "This variable is for aws assoociate public ip address"
}

variable "this_tag" {
    type = map 
    default = {
        Name = "StaticWebHostingInstance"
        Enivronment ="Dev"
    }
    description = "This variable is for aws instance tagging"
}

variable "this_security_group" {
    type = string
    default = "sg-01c97071bf05b4c77"
    description = "This variable is for aws security group" 
}

variable "domain_name" {
  description = "The domain name registered in Route 53"
  type        = string
  default     =  "shrutee.site"
}

variable "subdomain" {
  description = "Subdomain for the fregg app"
  type        = string
  default     = "photoprowess.shrutee.site"  # Example subdomain (e.g., 'todo.example.com')
}