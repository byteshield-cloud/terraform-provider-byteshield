# Example 2: Query SCDN Certificate
# This example demonstrates how to query a SCDN certificate by ID

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
  description = "Certificate ID to query"
  type        = string
}

# Query SCDN certificate
data "byteshield_scdn_certificate" "example" {
  id = var.certificate_id
}

output "certificate_id" {
  description = "Certificate ID"
  value       = data.byteshield_scdn_certificate.example.id
}

output "certificate_name" {
  description = "Certificate name"
  value       = data.byteshield_scdn_certificate.example.ca_name
}

output "issuer" {
  description = "Certificate issuer"
  value       = data.byteshield_scdn_certificate.example.issuer
}

output "issuer_start_time" {
  description = "Certificate start time"
  value       = data.byteshield_scdn_certificate.example.issuer_start_time
}

output "issuer_expiry_time" {
  description = "Certificate expiry time"
  value       = data.byteshield_scdn_certificate.example.issuer_expiry_time
}

output "issuer_expiry_time_desc" {
  description = "Certificate expiry time description"
  value       = data.byteshield_scdn_certificate.example.issuer_expiry_time_desc
}

output "binded" {
  description = "Whether the certificate is bound"
  value       = data.byteshield_scdn_certificate.example.binded
}

output "ca_domain" {
  description = "Domains in the certificate"
  value       = data.byteshield_scdn_certificate.example.ca_domain
}

output "apply_status" {
  description = "Application status"
  value       = data.byteshield_scdn_certificate.example.apply_status
}

output "ca_type" {
  description = "Certificate type"
  value       = data.byteshield_scdn_certificate.example.ca_type
}

