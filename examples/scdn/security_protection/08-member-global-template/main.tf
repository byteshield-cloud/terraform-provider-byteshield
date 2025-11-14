# Example 8: Query Member Global Template
# This example demonstrates how to query the member global security protection template

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

# Query member global template
data "byteshield_scdn_security_protection_member_global_template" "example" {
}

output "member_global_template" {
  description = "Member global template details"
  value = {
    bind_domain_count = data.byteshield_scdn_security_protection_member_global_template.example.bind_domain_count
    template          = data.byteshield_scdn_security_protection_member_global_template.example.template
  }
}

