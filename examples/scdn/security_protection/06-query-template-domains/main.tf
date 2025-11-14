# Example 6: Query Template Domains
# This example demonstrates how to query domains bound to a template

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

variable "business_id" {
  description = "Business ID (template ID)"
  type        = number
}

# Query template domains
data "byteshield_scdn_security_protection_template_domains" "example" {
  business_id = var.business_id
  page        = 1
  page_size   = 20
}

output "template_domains" {
  description = "Template domains"
  value = {
    total   = data.byteshield_scdn_security_protection_template_domains.example.total
    domains = data.byteshield_scdn_security_protection_template_domains.example.domains
  }
}

