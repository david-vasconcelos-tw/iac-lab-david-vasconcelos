variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "number_of_cidr_newbits" {
  description = "Number of CIDR bits for new subnets"
  type        = number
  default     = 3
}

variable "number_of_public_subnets" {
  description = "Number of public subnets to create"
  type        = number
}

variable "number_of_private_subnets" {
  description = "Number of private subnets to create"
  type        = number
}

variable "number_of_secure_subnets" {
  description = "Number of secure subnets to create"
  type        = number
}
