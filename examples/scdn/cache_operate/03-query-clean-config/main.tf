# Example 3: Query SCDN Cache Clean Config
# This example demonstrates how to query cache clean configuration

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

# Query SCDN cache clean config
data "byteshield_scdn_cache_clean_config" "example" {
}

output "config_id" {
  description = "Config ID"
  value       = data.byteshield_scdn_cache_clean_config.example.id
}

output "wholesite" {
  description = "Whole site config"
  value       = data.byteshield_scdn_cache_clean_config.example.wholesite
}

output "specialurl" {
  description = "Special URL config"
  value       = data.byteshield_scdn_cache_clean_config.example.specialurl
}

output "specialdir" {
  description = "Special directory config"
  value       = data.byteshield_scdn_cache_clean_config.example.specialdir
}

