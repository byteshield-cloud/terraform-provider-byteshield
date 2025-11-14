# Example 5: List Security Protection Templates
# This example demonstrates how to list security protection templates

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

variable "tpl_type" {
  description = "Template type: global, only_domain, more_domain"
  type        = string
  default     = "global"
}

# List security protection templates
data "byteshield_scdn_security_protection_templates" "example" {
  tpl_type  = var.tpl_type
  page      = 1
  page_size = 20
}

output "templates" {
  description = "Security protection templates list"
  value = {
    total     = data.byteshield_scdn_security_protection_templates.example.total
    templates = data.byteshield_scdn_security_protection_templates.example.templates
  }
}

