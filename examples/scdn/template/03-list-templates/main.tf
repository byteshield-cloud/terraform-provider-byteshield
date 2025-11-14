# Example 3: List SCDN Rule Templates
# This example demonstrates how to list SCDN rule templates

terraform {
  required_providers {
    byteshield = {
      source  = "byteshield-cloud/byteshield"
      version = "~> 1.0"
    }
  }
}

provider "byteshield" {
  access_key = var.access_key
  secret_key = var.secret_key
  endpoint   = var.endpoint
}

variable "access_key" {
  description = "ByteShield Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "ByteShield Secret Key"
  type        = string
  sensitive   = true
}

variable "endpoint" {
  description = "ByteShield SCDN API Endpoint"
  type        = string
  default     = "https://apiv4.lalcsafe.com"
}

variable "page" {
  description = "Page number for pagination"
  type        = number
  default     = 1
}

variable "page_size" {
  description = "Items per page"
  type        = number
  default     = 10
}

variable "name" {
  description = "Filter by rule template name"
  type        = string
  default     = ""
}

variable "domain" {
  description = "Filter by associated domain"
  type        = string
  default     = ""
}

variable "app_type" {
  description = "Filter by application type"
  type        = string
  default     = ""
}

# List SCDN rule templates
data "byteshield_scdn_rule_templates" "example" {
  page      = var.page
  page_size = var.page_size
  name      = var.name != "" ? var.name : null
  domain    = var.domain != "" ? var.domain : null
  app_type  = var.app_type != "" ? var.app_type : null
}

output "total" {
  description = "Total number of rule templates"
  value       = data.byteshield_scdn_rule_templates.example.total
}

output "templates" {
  description = "List of rule templates"
  value       = data.byteshield_scdn_rule_templates.example.list
}

