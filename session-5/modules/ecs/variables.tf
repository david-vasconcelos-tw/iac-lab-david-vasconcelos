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