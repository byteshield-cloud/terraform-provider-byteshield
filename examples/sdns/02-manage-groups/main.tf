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

variable "group_name" {
  description = "The name of the DNS group"
  type        = string
}

variable "domain_name" {
  description = "Domain to bind to group"
  type        = string
}

resource "byteshield_sdns_domain" "example" {
  domain = var.domain_name
}

resource "byteshield_sdns_domain_group" "example" {
  group_name = var.group_name
  remark     = "Managed by Terraform"
  domain_ids = [byteshield_sdns_domain.example.id]
}

output "group_id" {
  value = byteshield_sdns_domain_group.example.id
}

data "byteshield_sdns_domain_groups" "matched" {
  group_name = byteshield_sdns_domain_group.example.group_name
}

output "matched_groups" {
  value = data.byteshield_sdns_domain_groups.matched.groups
}
