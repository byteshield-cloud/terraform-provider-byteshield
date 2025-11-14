# Example 1: DDoS Protection Configuration
# This example demonstrates how to configure DDoS protection

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

variable "business_id" {
  description = "Business ID"
  type        = number
}

# Configure DDoS protection
resource "byteshield_scdn_security_protection_ddos_config" "example" {
  business_id = var.business_id

  application_ddos_protection {
    status                = "on"
    ai_cc_status          = "on"
    type                  = "strict"
    need_attack_detection = 1
    ai_status             = "on"
  }

  visitor_authentication {
    status           = "off"
    auth_token       = ""
    pass_still_check = 0
  }
}

output "ddos_config" {
  description = "DDoS protection configuration"
  value = {
    business_id = byteshield_scdn_security_protection_ddos_config.example.business_id
  }
}

