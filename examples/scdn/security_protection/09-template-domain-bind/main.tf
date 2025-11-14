# Example 9: Bind Template Domain
# This example demonstrates how to bind domains to a security protection template

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

variable "domain_ids" {
  description = "Domain ID list to bind"
  type        = list(number)
  default     = []
}

variable "group_ids" {
  description = "Group ID list to bind"
  type        = list(number)
  default     = []
}

# Bind template domain
resource "byteshield_scdn_security_protection_template_domain_bind" "example" {
  business_id = var.business_id
  domain_ids  = var.domain_ids
  group_ids   = var.group_ids
}

output "template_domain_bind" {
  description = "Template domain bind result"
  value = {
    business_id  = byteshield_scdn_security_protection_template_domain_bind.example.business_id
    fail_domains = byteshield_scdn_security_protection_template_domain_bind.example.fail_domains
  }
}

