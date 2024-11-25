# Define the configurations for each RDS instance
variable "rds_instances" {
  default = {
    prod = {
      instance_class = "db.t3.large"
      allocated_storage = 20
      username = "admin_prod1"
      password = "password_prod1"
    }
    dev = {
      instance_class = "db.t3.small"
      allocated_storage = 10
      username = "admin_dev2"
      password = "password_dev2"
    }
    test = {
      instance_class = "db.t3.micro"
      allocated_storage = 5
      username = "admin_test3"
      password = "password_test3"
    }
  }
}