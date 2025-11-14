# Example 2: Add Origin to Existing Domain
# This example demonstrates how to add an additional origin to an existing SCDN domain

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

variable "domain_id" {
  description = "Existing domain ID"
  type        = number
}

variable "origin_ip" {
  description = "New origin server IP address"
  type        = string
}

variable "origin_port" {
  description = "Origin server port"
  type        = number
  default     = 80
}

variable "priority" {
  description = "Origin priority"
  type        = number
  default     = 15
}

# Add origin to existing domain
resource "byteshield_scdn_origin" "example" {
  domain_id       = var.domain_id
  protocol        = 0  # HTTP
  listen_ports    = [8080]
  origin_protocol = 0  # HTTP
  load_balance    = 1  # Round Robin
  origin_type     = 0  # IP

  records {
    view     = "primary"
    value    = var.origin_ip
    port     = var.origin_port
    priority = var.priority
  }
}

output "origin_id" {
  description = "Created origin ID"
  value       = byteshield_scdn_origin.example.id
}

output "domain_id" {
  description = "Domain ID"
  value       = byteshield_scdn_origin.example.domain_id
}
