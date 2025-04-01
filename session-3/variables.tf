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

variable "subnet1_cidr" {
  description = "Subnet 1 CIDR block"
  type        = string
}

variable "subnet2_cidr" {
  description = "Subnet 2 CIDR block"
  type        = string
}

variable "subnet3_cidr" {
  description = "Subnet 3 CIDR block"
  type        = string
}

variable "subnet4_cidr" {
  description = "Subnet 4 CIDR block"
  type        = string
}

variable "subnet5_cidr" {
  description = "Subnet 5 CIDR block"
  type        = string
}

variable "subnet6_cidr" {
  description = "Subnet 6 CIDR block"
  type        = string
}

variable "subnet8_cidr" {
  description = "Subnet 8 CIDR block"
  type        = string
}