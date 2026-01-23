# Example 4: Import Resources
# This example demonstrates how to import existing resources into Terraform state.

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
  description = "Byteshield Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Byteshield Secret Key"
  type        = string
  sensitive   = true
}

variable "endpoint" {
  description = "Byteshield SCDN API Endpoint"
  type        = string
  default     = "https://apiv4.lalcsafe.com/"
}

# 1. User IP List Import
# Create a resource block that matches the configuration of the existing resource.
resource "byteshield_scdn_user_ip" "imported_list" {
}

# 2. User IP Item Import
# Create a resource block for the item.
resource "byteshield_scdn_user_ip_item" "imported_item" {
}
