
module "ec2" {
    source = "/home/cloudshell-user/Terraform/Module/Resources/EC2"
    this_image_id = "ami-005fc0f236362e99f"
    this_list = "t2.micro"
    this_disable_api_stop = false
    this_disable_api_termination = false
    #this_vpc_security_group_ids = "sg-01c97071bf05b4c77"
    this_aws_instance_subnet = module.vpc.subnet_id
    #this_sg_vpc_id = module.vpc.vpc_id
    //this_aws_vpc_id = module.aws_vpc.aws_vpc_id
}

module "vpc" {
     source = "/home/cloudshell-user/Terraform/Module/Resources/Vpc"
     this_vpc_cidr_block = "172.31.0.0/16"
     this_vpc_tags = "this_vpc"
     this_subnet_pub_cidr_block = "172.31.16.0/20"
     this_subnet_pub_map_ip  = true 
     this_subnet_pub_tags = "pub_subnet"
     this_vpc_az = "us-east-1a"




}