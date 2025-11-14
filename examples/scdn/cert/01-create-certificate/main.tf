# Example 1: Create SCDN Certificate
# This example demonstrates how to create a basic SCDN certificate

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

variable "ca_name" {
  description = "Certificate name"
  type        = string
}

variable "ca_cert" {
  description = "Certificate public key (PEM format)"
  type        = string
  sensitive   = true
}

variable "ca_key" {
  description = "Certificate private key (PEM format)"
  type        = string
  sensitive   = true
}

# Create SCDN certificate
resource "byteshield_scdn_certificate" "example" {
  ca_name = var.ca_name
  ca_cert = var.ca_cert
  ca_key  = var.ca_key
}

output "certificate_id" {
  description = "Created certificate ID"
  value       = byteshield_scdn_certificate.example.id
}

output "certificate_name" {
  description = "Certificate name"
  value       = byteshield_scdn_certificate.example.ca_name
}

output "certificate_sn" {
  description = "Certificate serial number"
  value       = byteshield_scdn_certificate.example.ca_sn
}

output "issuer" {
  description = "Certificate issuer"
  value       = byteshield_scdn_certificate.example.issuer
}

output "issuer_expiry_time" {
  description = "Certificate expiry time"
  value       = byteshield_scdn_certificate.example.issuer_expiry_time
}

output "binded" {
  description = "Whether the certificate is bound"
  value       = byteshield_scdn_certificate.example.binded
}

