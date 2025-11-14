# Example 10: Query Domain Templates
# This example demonstrates how to query templates for a domain

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

variable "domain_id" {
  description = "Domain ID to query templates"
  type        = number
}

# Query domain templates
data "byteshield_scdn_domain_templates" "example" {
  domain_id = var.domain_id
}

output "domain_templates" {
  description = "Templates bound to the domain"
  value = {
    domain_id       = var.domain_id
    binded_templates = [
      for template in data.byteshield_scdn_domain_templates.example.binded_templates : {
        business_id   = template.business_id
        business_type = template.business_type
        app_type      = template.app_type
        name          = template.name
      }
    ]
  }
}

output "templates_count" {
  description = "Number of templates bound to the domain"
  value       = length(data.byteshield_scdn_domain_templates.example.binded_templates)
}

