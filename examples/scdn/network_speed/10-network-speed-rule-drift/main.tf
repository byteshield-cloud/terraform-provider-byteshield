# Example: Network Speed Rule Drift and Duplication
# This example demonstrates the drift issue where rule_id is planned to be removed,
# and potential duplication issues.

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
  description = "Byteshield SCDN API Endpoint"
  type        = string
  default     = "https://apiv4.lalcsafe.com"
}

resource "byteshield_scdn_rule_template" "example" {
  name        = "test-network-speed"
  description = "Demo for network speed rule fix"
  app_type    = "network_speed"
}

resource "byteshield_scdn_network_speed_rule" "example" {
  business_id   = byteshield_scdn_rule_template.example.id
  business_type = "tpl"
  config_group  = "customized_req_headers_rule"

  customized_req_headers_rule {
    type    = "add"
    content = "X-Test-Header: demo"
    remark  = "testing drift fix"
  }
}
