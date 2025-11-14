# Example 11: Manage Domain Status (Enable/Disable)
# This example demonstrates how to enable or disable a domain

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
  description = "Domain ID to manage status"
  type        = number
}

variable "enabled" {
  description = "Whether the domain is enabled (true) or disabled (false)"
  type        = bool
  default     = true
}

# Manage domain status
resource "byteshield_scdn_domain_status" "example" {
  domain_id = var.domain_id
  enabled   = var.enabled
}

output "domain_id" {
  description = "Domain ID"
  value       = byteshield_scdn_domain_status.example.domain_id
}

output "enabled" {
  description = "Domain enabled status"
  value       = byteshield_scdn_domain_status.example.enabled
}

