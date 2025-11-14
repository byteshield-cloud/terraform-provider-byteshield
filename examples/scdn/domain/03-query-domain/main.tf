# Example 3: Query SCDN Domain
# This example demonstrates how to query a single SCDN domain by domain name

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

variable "domain_name" {
  description = "Domain name to query"
  type        = string
}

# Query single SCDN domain
data "byteshield_scdn_domain" "example" {
  domain = var.domain_name
}

output "domain_info" {
  description = "Domain information"
  value = {
    id              = data.byteshield_scdn_domain.example.id
    domain          = data.byteshield_scdn_domain.example.domain
    remark          = data.byteshield_scdn_domain.example.remark
    access_progress = data.byteshield_scdn_domain.example.access_progress
    protect_status  = data.byteshield_scdn_domain.example.protect_status
    cname           = data.byteshield_scdn_domain.example.cname
  }
}
