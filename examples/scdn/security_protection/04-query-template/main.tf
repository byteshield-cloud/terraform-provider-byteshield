# Example 4: Query Security Protection Template
# This example demonstrates how to query a security protection template

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

# Query security protection template
data "byteshield_scdn_security_protection_template" "example" {
  business_id = var.business_id
}

output "template" {
  description = "Security protection template details"
  value = {
    business_id       = data.byteshield_scdn_security_protection_template.example.business_id
    name              = data.byteshield_scdn_security_protection_template.example.name
    type              = data.byteshield_scdn_security_protection_template.example.type
    created_at        = data.byteshield_scdn_security_protection_template.example.created_at
    remark            = data.byteshield_scdn_security_protection_template.example.remark
    bind_domain_count = data.byteshield_scdn_security_protection_template.example.bind_domain_count
  }
}

