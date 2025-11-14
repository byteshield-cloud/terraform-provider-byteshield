# Example 9: Query Access Progress Status
# This example demonstrates how to query access progress status options

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

# Query access progress status options
data "byteshield_scdn_access_progress" "example" {
}

output "access_progress_options" {
  description = "Available access progress status options"
  value       = data.byteshield_scdn_access_progress.example.progress
}

output "progress_count" {
  description = "Number of available progress status options"
  value       = length(data.byteshield_scdn_access_progress.example.progress)
}

