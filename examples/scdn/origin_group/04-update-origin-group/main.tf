# Example 4: Update Origin Group
# This example demonstrates how to update an origin group

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

variable "name" {
  description = "Origin group name"
  type        = string
  default     = "updated-origin-group"
}

variable "remark" {
  description = "Remark"
  type        = string
  default     = "Updated remark"
}

# Update origin group
resource "byteshield_scdn_origin_group" "example" {
  origin_group_id = var.origin_group_id
  name            = var.name
  remark          = var.remark

  origins {
    origin_type = 0 # IP

    records {
      value    = "2.2.2.2"
      port     = 80
      priority = 20
      view     = "primary"
    }

    protocol_ports {
      protocol     = 0 # http
      listen_ports = [80]
    }

    origin_protocol = 0 # http
    load_balance    = 1  # round_robin
  }
}

output "origin_group" {
  description = "Updated origin group details"
  value = {
    origin_group_id = byteshield_scdn_origin_group.example.origin_group_id
    name            = byteshield_scdn_origin_group.example.name
    updated_at      = byteshield_scdn_origin_group.example.updated_at
  }
}

