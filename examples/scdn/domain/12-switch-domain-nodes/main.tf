# Example 12: Switch Domain Nodes
# This example demonstrates how to switch domain node type

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
  description = "Domain ID to switch nodes"
  type        = number
}

variable "protect_status" {
  description = "Edge node type. Valid values: back_source, scdn, exclusive"
  type        = string
  default     = "scdn"
}

variable "exclusive_resource_id" {
  description = "Exclusive resource ID (required if protect_status is exclusive)"
  type        = number
  default     = null
}

# Switch domain nodes
resource "byteshield_scdn_domain_node_switch" "example" {
  domain_id            = var.domain_id
  protect_status       = var.protect_status
  exclusive_resource_id = var.exclusive_resource_id
}

output "domain_id" {
  description = "Domain ID"
  value       = byteshield_scdn_domain_node_switch.example.domain_id
}

output "protect_status" {
  description = "Current protect status"
  value       = byteshield_scdn_domain_node_switch.example.protect_status
}

