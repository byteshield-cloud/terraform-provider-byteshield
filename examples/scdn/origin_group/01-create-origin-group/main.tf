# Example 1: Create Origin Group
# This example demonstrates how to create an origin group

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

variable "name" {
  description = "Origin group name"
  type        = string
  default     = "test-origin-group"
}

variable "remark" {
  description = "Remark"
  type        = string
  default     = "Test origin group"
}

# Create origin group
resource "byteshield_scdn_origin_group" "example" {
  name   = var.name
  remark = var.remark

  origins {
    origin_type = 0 # IP

    records {
      value    = "54.85.23.59"
      port     = 80
      priority = 10
      view     = "primary"
      host     = "example.com"
    }

    protocol_ports {
      protocol     = 0 # http
      listen_ports = [80, 8080]
    }

    origin_protocol = 0 # http
    load_balance    = 1  # round_robin
  }
}

output "origin_group" {
  description = "Origin group details"
  value = {
    origin_group_id = byteshield_scdn_origin_group.example.origin_group_id
    name            = byteshield_scdn_origin_group.example.name
    created_at      = byteshield_scdn_origin_group.example.created_at
  }
}

