# Example 3: List Origin Groups
# This example demonstrates how to list origin groups

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
  description = "Origin group name filter (optional)"
  type        = string
  default     = ""
}

variable "page" {
  description = "Page number"
  type        = number
  default     = 1
}

variable "page_size" {
  description = "Page size"
  type        = number
  default     = 20
}

# List origin groups
data "byteshield_scdn_origin_groups" "example" {
  page      = var.page
  page_size = var.page_size
  name      = var.name
}

output "origin_groups" {
  description = "Origin groups list"
  value = {
    total        = data.byteshield_scdn_origin_groups.example.total
    origin_groups = data.byteshield_scdn_origin_groups.example.origin_groups
  }
}

