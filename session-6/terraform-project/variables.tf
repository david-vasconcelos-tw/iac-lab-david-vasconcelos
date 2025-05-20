variable "prefix" {
  description = "Prefix for all resources"
  type        = string
  default     = "david-vasconcelos-iac-lab"
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "TFC_AWS_PROVIDER_AUTH" {
  description = "Terraform auth provider"
  type = bool
}

variable "TFC_AWS_RUN_ROLE_ARN" {
  description = "Terraform run arn"
  type = string
}

