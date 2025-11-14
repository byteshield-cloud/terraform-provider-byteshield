# Example 11: Query Template Unbound Domains
# This example demonstrates how to query domains that are not bound to any template

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

variable "domain" {
  description = "Domain filter (optional)"
  type        = string
  default     = ""
}

variable "page" {
  description = "Page number"
  type        = number
  default     = 1
}

variable "page_size" {
  description = "Page size"
  type        = number
  default     = 20
}

# Query template unbound domains
data "byteshield_scdn_security_protection_template_unbound_domains" "example" {
  domain    = var.domain
  page      = var.page
  page_size = var.page_size
}

output "template_unbound_domains" {
  description = "Template unbound domains"
  value = {
    total   = data.byteshield_scdn_security_protection_template_unbound_domains.example.total
    domains = data.byteshield_scdn_security_protection_template_unbound_domains.example.domains
  }
}

