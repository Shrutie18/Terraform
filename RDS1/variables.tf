variable "this_db_engine" {
  type        = string
  default = "mysql"
}

variable "this_engine_version" {
  type        = string 
  default = "8.0"
}
variable "this_instance_class" {
    type = string 
    default = "db.t3.micro" 
}
variable "this_db_name" {
    type = string 
    default = "mydatabase_mysql_1"
     
}
variable "this_username" {
    type = string 
    default = "admin"
     
}

variable "this_pass" {
    type = string 
    default = "password123"
     
}

variable "this_list" {
    type = list 
    default = ["20" , "mysql" , "8.0" , "db.t3.micro" , "mydatabase_mysql_1" , "admin" , "password123" , "default.mysql8.0" , "true" , "true" , "sg-01c97071bf05b4c77" , "false"]
     
}