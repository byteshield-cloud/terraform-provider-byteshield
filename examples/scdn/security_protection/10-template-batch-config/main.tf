# Example 10: Batch Config Security Protection Template
# This example demonstrates how to batch configure security protection templates

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

variable "template_ids" {
  description = "Template ID list"
  type        = list(number)
}

# Batch configure security protection templates
resource "byteshield_scdn_security_protection_template_batch_config" "example" {
  template_ids = var.template_ids

  ddos_config {
    application_ddos_protection {
      status                = "on"
      ai_cc_status          = "on"
      type                  = "strict"
      need_attack_detection = 1
      ai_status             = "on"
    }
  }

  waf_rule_config {
    waf_rule_config {
      status    = "on"
      ai_status = "on"
      waf_level = "strict"
      waf_mode  = "block"
    }

    waf_intercept_page {
      status  = "on"
      type    = "default"
      content = ""
    }
  }
}

output "template_batch_config" {
  description = "Template batch config result"
  value = {
    template_ids   = byteshield_scdn_security_protection_template_batch_config.example.template_ids
    fail_templates = byteshield_scdn_security_protection_template_batch_config.example.fail_templates
  }
}

