# Example 3: Security Protection Template
# This example demonstrates how to create a security protection template

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

variable "template_name" {
  description = "Template name"
  type        = string
  default     = "test-security-template"
}

variable "remark" {
  description = "Template remark"
  type        = string
  default     = "Test security protection template"
}

# Create security protection template
resource "byteshield_scdn_security_protection_template" "example" {
  name   = var.template_name
  remark = var.remark
}

output "template" {
  description = "Security protection template"
  value = {
    business_id = byteshield_scdn_security_protection_template.example.business_id
    name        = byteshield_scdn_security_protection_template.example.name
    type        = byteshield_scdn_security_protection_template.example.type
  }
}

