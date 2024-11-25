provider "aws" {
   profile = "shruti"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}


resource "aws_iam_user" "this_aws_iam_user" { 
    count = length(var.users_list)  #3
    name = var.users_list[count.index]
}  
resource "aws_iam_user" "this_aws_iam_user_2" { 
    name = "shrutee.${count.index}"   #shrutee
    count = 3 
}  


variable "users_list" {
    default = ["user1" , "user2" , "user3"]
}                #0         #1       #2
  