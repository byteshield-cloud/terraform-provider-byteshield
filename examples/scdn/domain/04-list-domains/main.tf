# Example 4: List SCDN Domains
# This example demonstrates how to query a list of SCDN domains

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

variable "page" {
  description = "Page number"
  type        = number
  default     = 1
}

variable "page_size" {
  description = "Number of items per page"
  type        = number
  default     = 10
}

variable "group_id" {
  description = "Filter by group ID (optional)"
  type        = number
  default     = null
}

# Query list of SCDN domains
data "byteshield_scdn_domains" "example" {
  page      = var.page
  page_size = var.page_size
  group_id  = var.group_id
}

output "domains_list" {
  description = "List of SCDN domains"
  value = [
    for domain in data.byteshield_scdn_domains.example.domains : {
      id              = domain.id
      domain          = domain.domain
      remark          = domain.remark
      access_progress = domain.access_progress
      protect_status  = domain.protect_status
    }
  ]
}

output "total_count" {
  description = "Total number of domains"
  value       = length(data.byteshield_scdn_domains.example.domains)
}
