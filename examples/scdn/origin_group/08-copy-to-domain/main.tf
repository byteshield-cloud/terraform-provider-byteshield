# Example 8: Copy Origin Group to Domain
# This example demonstrates how to copy an origin group to a domain

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

variable "origin_group_id" {
  description = "Origin group ID"
  type        = number
}

variable "domain_id" {
  description = "Domain ID"
  type        = number
}

# Copy origin group to domain
resource "byteshield_scdn_origin_group_domain_copy" "example" {
  origin_group_id = var.origin_group_id
  domain_id       = var.domain_id
}

output "copy_result" {
  description = "Copy result"
  value = {
    origin_group_id = byteshield_scdn_origin_group_domain_copy.example.origin_group_id
    domain_id       = byteshield_scdn_origin_group_domain_copy.example.domain_id
  }
}

