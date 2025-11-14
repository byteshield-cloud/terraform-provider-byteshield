# Example 4: Update SCDN Rule Template
# This example demonstrates how to update an existing SCDN rule template

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
  description = "Rule template ID to update (import first: terraform import byteshield_scdn_rule_template.example <template_id>)"
  type        = string
}

variable "template_name" {
  description = "Updated rule template name"
  type        = string
}

variable "description" {
  description = "Updated rule template description"
  type        = string
  default     = ""
}

variable "app_type" {
  description = "Application type (required for import)"
  type        = string
}

# Update SCDN rule template
# Note: You can either provide template_id to update directly, or import the existing template first
resource "byteshield_scdn_rule_template" "example" {
  template_id = var.template_id  # If provided, this will update the existing template instead of creating a new one
  name        = var.template_name
  description = var.description
  app_type    = var.app_type
}

output "template_id" {
  description = "Updated rule template ID"
  value       = byteshield_scdn_rule_template.example.id
}

output "template_name" {
  description = "Updated rule template name"
  value       = byteshield_scdn_rule_template.example.name
}

