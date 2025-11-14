# Example 6: Bind Origin Group to Domains
# This example demonstrates how to bind an origin group to domains

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

variable "domain_ids" {
  description = "Domain ID array"
  type        = list(number)
  default     = []
}

variable "domain_group_ids" {
  description = "Domain group ID array"
  type        = list(number)
  default     = []
}

variable "domains" {
  description = "Domain array"
  type        = list(string)
  default     = []
}

# Bind origin group to domains
resource "byteshield_scdn_origin_group_domain_bind" "example" {
  origin_group_id  = var.origin_group_id
  domain_ids       = var.domain_ids
  domain_group_ids = var.domain_group_ids
  domains          = var.domains
}

output "bind_result" {
  description = "Bind result"
  value = {
    origin_group_id = byteshield_scdn_origin_group_domain_bind.example.origin_group_id
    job_id          = byteshield_scdn_origin_group_domain_bind.example.job_id
  }
}

