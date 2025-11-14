# Example 6: Manage Cache Rule Status
# This example demonstrates how to enable or disable cache rules

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

variable "business_id" {
  description = "Business ID (template ID for 'tpl' type, domain ID for 'domain' type)"
  type        = number
}

variable "business_type" {
  description = "Business type: 'tpl' (template) or 'domain'"
  type        = string
  default     = "tpl"
}

variable "rule_ids" {
  description = "List of cache rule IDs to update status"
  type        = list(number)
}

variable "status" {
  description = "Status: 1 (enabled) or 2 (disabled)"
  type        = number
}

# Manage cache rule status
resource "byteshield_scdn_cache_rule_status" "example" {
  business_id   = var.business_id
  business_type = var.business_type
  rule_ids      = var.rule_ids
  status        = var.status
}

output "updated_ids" {
  description = "Rule IDs that were updated"
  value       = byteshield_scdn_cache_rule_status.example.updated_ids
}

