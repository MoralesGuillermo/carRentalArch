variable "subscription_id" {
  description = "The subscription ID for the Azure subscription"
  type        = string
}

variable "project" {
    type= string
    description = "The name of the project the resource group belongs to"
    default = "carrental"
}

variable environment {
    type = string
    description = "The environment for the resources"
    default = "prod"
}

variable "location" {
  description = "The Azure region to deploy resources in"
  type        = string
  default     = "East US 2"
}

variable "tags" {
    description = "A map of tags to apply to a resource group"
    type        = map(string)
    default ={
        environment = "production"
        date        = "2025-31-10"
        createdBy   = "Terraform"
    }
}

variable "admin_sql_password" {
  description = "The administrator password for the SQL server"
  type        = string
  sensitive   = true
}
