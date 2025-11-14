# Example 7: Apply for SCDN Certificate
# This example demonstrates how to apply for a certificate (Let's Encrypt, etc.)

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

variable "domains" {
  description = "List of domains to apply for certificate"
  type        = list(string)
}

# Apply for certificate
resource "byteshield_scdn_certificate_apply" "example" {
  domain = var.domains
}

output "certificate_application_id" {
  description = "Certificate application resource ID"
  value       = byteshield_scdn_certificate_apply.example.id
}

output "ca_id_domains" {
  description = "Mapping of domain_id to domain"
  value       = byteshield_scdn_certificate_apply.example.ca_id_domains
}

output "ca_id_names" {
  description = "Mapping of ca_id to ca_name"
  value       = byteshield_scdn_certificate_apply.example.ca_id_names
}

output "domain_count" {
  description = "Number of domains applied"
  value       = length(var.domains)
}

output "certificate_ids" {
  description = "List of certificate IDs created"
  value = [
    for ca_id, _ in byteshield_scdn_certificate_apply.example.ca_id_names : ca_id
  ]
}

output "certificate_names" {
  description = "List of certificate names created"
  value = [
    for _, ca_name in byteshield_scdn_certificate_apply.example.ca_id_names : ca_name
  ]
}

