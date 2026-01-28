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
  description = "The domain name to manage"
  type        = string
}

resource "byteshield_sdns_domain" "example" {
  domain = var.domain_name
}

output "domain_id" {
  value = byteshield_sdns_domain.example.id
}

output "domain_status" {
  value = byteshield_sdns_domain.example.status
}

data "byteshield_sdns_domains" "matched" {
  domain = byteshield_sdns_domain.example.domain
}

output "matched_domains" {
  value = data.byteshield_sdns_domains.matched.domains
}
