# Example 5: Query SCDN Origin
# This example demonstrates how to query origin information for a domain

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
  description = "Domain ID to query origins for"
  type        = number
}

# Query all origins for a domain
data "byteshield_scdn_origins" "example" {
  domain_id = var.domain_id
}

output "origins_list" {
  description = "List of origins for the domain"
  value = [
    for origin in data.byteshield_scdn_origins.example.origins : {
      id             = origin.id
      protocol       = origin.protocol
      listen_port    = origin.listen_port
      origin_protocol = origin.origin_protocol
      load_balance   = origin.load_balance
      origin_type    = origin.origin_type
      records        = origin.records
    }
  ]
}

output "origins_count" {
  description = "Number of origins for the domain"
  value       = length(data.byteshield_scdn_origins.example.origins)
}
