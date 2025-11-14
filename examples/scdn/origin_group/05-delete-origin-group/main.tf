# Example 5: Delete Origin Group
# This example demonstrates how to delete an origin group

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
  description = "Origin group ID to delete"
  type        = number
}

# Delete origin group
resource "byteshield_scdn_origin_group" "example" {
  origin_group_id = var.origin_group_id
  name            = "temp-name" # Required field, will be deleted
  remark          = "temp-remark"

  origins {
    origin_type = 0

    records {
      value    = "1.1.1.1"
      port     = 80
      priority = 10
      view     = "primary"
    }

    protocol_ports {
      protocol     = 0
      listen_ports = [80]
    }

    origin_protocol = 0
    load_balance    = 1
  }
}

# Note: To delete, run: terraform destroy

