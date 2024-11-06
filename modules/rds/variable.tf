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

variable "instance_class" {
  type        = string
  description = "The instance type for the RDS instance"
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage in GBs"
  default     = 20
}

variable "engine" {
  type        = string
  description = "The database engine to use (e.g., mysql, postgres)"
  default     = "mysql"
}

variable "engine_version" {
  type        = string
  description = "The version of the database engine"
  default     = "8.0"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the RDS subnet group"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of VPC security group IDs to assign to the RDS instance"
}

variable "publicly_accessible" {
  type        = bool
  description = "Whether the RDS instance should be publicly accessible"
  default     = false
}
