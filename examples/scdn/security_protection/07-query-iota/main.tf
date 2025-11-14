# Example 7: Query Security Protection Iota
# This example demonstrates how to query security protection enum values

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

# Query security protection iota
data "byteshield_scdn_security_protection_iota" "example" {
}

output "iota" {
  description = "Security protection enum values"
  value       = data.byteshield_scdn_security_protection_iota.example.iota
}

