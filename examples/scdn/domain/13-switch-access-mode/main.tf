# Example 13: Switch Domain Access Mode
# This example demonstrates how to switch domain access mode

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
  description = "Domain ID to switch access mode"
  type        = number
}

variable "access_mode" {
  description = "Access mode. Valid values: ns, cname"
  type        = string
  default     = "cname"
}

# Switch domain access mode
resource "byteshield_scdn_domain_access_mode" "example" {
  domain_id   = var.domain_id
  access_mode = var.access_mode
}

output "domain_id" {
  description = "Domain ID"
  value       = byteshield_scdn_domain_access_mode.example.domain_id
}

output "access_mode" {
  description = "Current access mode"
  value       = byteshield_scdn_domain_access_mode.example.access_mode
}

