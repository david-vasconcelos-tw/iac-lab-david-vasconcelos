variable "prefix" {
  type        = string
  description = "Prefix to many of the resources created which helps as an identifier, could be company name, solution name, etc"
  default     = "david-vasconcelos-iac-lab"
}

variable "region" {
  type        = string
  description = "Region to deploy the solution"
  default     = "us-east-2"
}

variable "tfc_aws_audience" {
  type        = string
  default     = "aws.workload.identity"
  description = "The audience value to use in run identity tokens"
}

variable "tfc_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "The hostname of the TFC or TFE instance you'd like to use with AWS"
}

variable "tfc_organization_name" {
  type        = string
  description = "The name of your Terraform Cloud organization"
  default     = "david-vasconcelos-iac-lab"
}

variable "tfc_project_name" {
  type        = string
  default     = "session-6"
  description = "The project under which a workspace will be created"
}

variable "tfc_workspace_name" {
  type        = string
  default     = "iac-lab"
  description = "The name of the workspace that you'd like to create and connect to AWS"
}