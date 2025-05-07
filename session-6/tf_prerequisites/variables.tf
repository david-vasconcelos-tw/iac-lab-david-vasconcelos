variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "repo_name" {
  description = "GitHub repository name"
  type        = string  
}

