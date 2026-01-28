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
  description = "Byteshield API Endpoint"
  type        = string
  default     = "https://apiv4.lalcsafe.com"
}

variable "domain_name" {
  description = "Domain to create records for"
  type        = string
}

variable "record_name" {
  description = "Record name"
  type        = string
}

variable "record_value" {
  description = "Record value"
  type        = string
}

resource "byteshield_dns_domain" "example" {
  domain = var.domain_name
}

resource "byteshield_dns_record" "example" {
  domain_id = tonumber(byteshield_dns_domain.example.id)
  name      = var.record_name
  type      = "A"
  view      = "any"
  value     = var.record_value
  ttl       = 600
  remark    = "Managed by ...."
}

output "record_id" {
  value = byteshield_dns_record.example.id
}

data "byteshield_dns_record" "matched" {
  domain_id = tonumber(byteshield_dns_domain.example.id)
}

output "all_records" {
  value = data.byteshield_dns_record.matched.records
}
