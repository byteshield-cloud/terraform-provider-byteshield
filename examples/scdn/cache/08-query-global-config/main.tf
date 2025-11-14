# Example 8: Query Global Cache Config
# This example demonstrates how to query the default global cache configuration

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

# Query global cache configuration
data "byteshield_scdn_cache_global_config" "example" {
}

output "global_config" {
  description = "Global cache configuration"
  value = {
    id   = data.byteshield_scdn_cache_global_config.example.id
    name = data.byteshield_scdn_cache_global_config.example.name
    conf = data.byteshield_scdn_cache_global_config.example.conf
  }
}

