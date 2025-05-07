variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "intra_subnets" {
  description = "List of private subnets"
  type        = list(string)  
}

variable "vpc_id" {
  description = "Value of the VPC ID"
  type        = string
}

variable "ecs_security_group_id" {
  description = "ID of the ECS security group"
  type        = string  
}

variable "db_username" {
  type        = string
  description = "Database username"
}

variable "db_name" {
  type        = string
  description = "Database name"
}
