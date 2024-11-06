variable "db_name" {
  type        = string
  description = "The name of the database"
}

variable "username" {
  type        = string
  description = "The master username for the database"
}

variable "password" {
  type        = string
  description = "The master password for the database"
  sensitive   = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs"
}
