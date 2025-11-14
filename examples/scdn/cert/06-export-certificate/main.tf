# Example 6: Export SCDN Certificate
# This example demonstrates how to export a certificate

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

variable "certificate_id" {
  description = "Certificate ID to export (can be a single ID or comma-separated IDs)"
  type        = string
}

variable "product_flag" {
  description = "Product flag (optional)"
  type        = string
  default     = ""
}

# Export certificate
data "byteshield_scdn_certificate_export" "example" {
  id          = var.certificate_id
  product_flag = var.product_flag != "" ? var.product_flag : null
}

output "exports" {
  description = "List of exported certificate data"
  value       = data.byteshield_scdn_certificate_export.example.exports
}

output "export_count" {
  description = "Number of exports"
  value       = length(data.byteshield_scdn_certificate_export.example.exports)
}

output "export_urls" {
  description = "Export download URLs"
  value = [
    for export in data.byteshield_scdn_certificate_export.example.exports : export.real_url
  ]
}

output "export_details" {
  description = "Detailed export information"
  value = {
    for idx, export in data.byteshield_scdn_certificate_export.example.exports : idx => {
      hash    = export.hash
      key     = export.key
      real_url = export.real_url
    }
  }
}

