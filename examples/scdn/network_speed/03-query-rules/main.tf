# Example 3: Query Network Speed Rules
# This example demonstrates how to query network speed rules for a template

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
  description = "Business ID (template ID for 'tpl' type)"
  type        = number
}

variable "business_type" {
  description = "Business type: 'tpl' (template) or 'global'"
  type        = string
  default     = "tpl"
}

variable "config_group" {
  description = "Rule group: 'custom_page', 'upstream_uri_change_rule', 'resp_headers_rule', or 'customized_req_headers_rule'"
  type        = string
}

# Query network speed rules
data "byteshield_scdn_network_speed_rules" "example" {
  business_id   = var.business_id
  business_type = var.business_type
  config_group  = var.config_group
}

output "total" {
  description = "Total number of rules"
  value       = data.byteshield_scdn_network_speed_rules.example.total
}

output "rules" {
  description = "List of network speed rules"
  value       = data.byteshield_scdn_network_speed_rules.example.list
}

