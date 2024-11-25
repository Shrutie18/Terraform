resource "aws_iam_user" "main_user1" {
    name =  var.aws_user_name-1[count.index]
    count = length(var.aws_user_name-1)
}

 variable "aws_user_name-1" {
  default = ["alinux", "Redhatlinux", "windows"]
}
