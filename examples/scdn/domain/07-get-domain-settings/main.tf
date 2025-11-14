# Example 7: Query Domain Base Settings
# This example demonstrates how to query domain base settings

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
  description = "Domain ID to query base settings"
  type        = number
}

# Query domain base settings
data "byteshield_scdn_domain_base_settings" "example" {
  domain_id = var.domain_id
}

output "domain_settings" {
  description = "Domain base settings information"
  value = {
    domain_id       = var.domain_id
    proxy_host      = data.byteshield_scdn_domain_base_settings.example.proxy_host
    proxy_sni       = data.byteshield_scdn_domain_base_settings.example.proxy_sni
    domain_redirect = data.byteshield_scdn_domain_base_settings.example.domain_redirect
  }
}

