variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "vpc_id" {
  description = "Value of the VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)  
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)  
}

variable "alb_target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string  
}

variable "alb_security_group_id" {
  description = "ID of the ALB security group"
  type        = string    
}

variable "db_address" {
  description = "Database address"
  type        = string  
}

variable "db_name" {
  description = "Database name"
  type        = string    
}

variable "db_username" {
  description = "Database username"
  type        = string      
}

variable "db_secret_arn" {
  description = "ARN of the database secret"
  type        = string  
}

variable "db_secret_key_id" {
  description = "ID of the database secret key"
  type        = string    
}

variable "container_cpu_architecture" {
  description = "CPU architecture for the container"
  type        = string
}