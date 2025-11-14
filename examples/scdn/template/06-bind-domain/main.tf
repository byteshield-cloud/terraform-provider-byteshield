# Example 6: Bind Domain to Rule Template
# This example demonstrates how to bind domains to a rule template using Terraform

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

variable "template_id" {
  description = "Rule template ID"
  type        = number
}

variable "domain_ids" {
  description = "List of domain IDs to bind to the template"
  type        = list(number)
}

# Query the template to verify it exists
data "byteshield_scdn_rule_template" "example" {
  id       = tostring(var.template_id)
  app_type = "network_speed"  # Update with your app_type
}

# Query bound domains for the template (before binding)
data "byteshield_scdn_rule_template_domains" "example" {
  id       = var.template_id
  app_type = "network_speed"  # Update with your app_type
}

# Bind domains to the rule template
resource "byteshield_scdn_rule_template_domain_bind" "example" {
  template_id = var.template_id
  domain_ids  = var.domain_ids
}

output "template_info" {
  description = "Template information"
  value = {
    id          = data.byteshield_scdn_rule_template.example.id
    name        = data.byteshield_scdn_rule_template.example.name
    description = data.byteshield_scdn_rule_template.example.description
  }
}

output "domains_before_bind" {
  description = "Domains bound to template before binding"
  value       = data.byteshield_scdn_rule_template_domains.example.list
}

output "bind_operation_id" {
  description = "ID of the bind operation"
  value       = byteshield_scdn_rule_template_domain_bind.example.id
}

output "domains_bound" {
  description = "Domain IDs that were bound"
  value       = var.domain_ids
}

