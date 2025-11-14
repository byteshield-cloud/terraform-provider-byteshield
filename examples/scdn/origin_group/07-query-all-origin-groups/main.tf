# Example 7: Query All Origin Groups
# This example demonstrates how to query all origin groups for domain configuration

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

variable "protect_status" {
  description = "Protection status: scdn-shared nodes, exclusive-dedicated nodes"
  type        = string
  default     = "scdn"
}

# Query all origin groups
data "byteshield_scdn_origin_groups_all" "example" {
  protect_status = var.protect_status
}

output "origin_groups" {
  description = "All origin groups"
  value = {
    total        = data.byteshield_scdn_origin_groups_all.example.total
    origin_groups = data.byteshield_scdn_origin_groups_all.example.origin_groups
  }
}

