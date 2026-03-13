# Example: Import SCDN Network Speed Config
# This example demonstrates how to import an existing network speed configuration into Terraform

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

# Managed resource for import
resource "byteshield_scdn_network_speed_config" "example" {
  # business_id   = var.business_id
  # business_type = var.business_type

  # You can now import without specifying these in advance!
  # terraform import byteshield_scdn_network_speed_config.example <business_id>-<business_type>
  # based on the imported state to avoid unwanted changes during the next apply.


  domain_proxy_conf {
    proxy_connect_timeout = 60
    fails_timeout         = 10
    keep_new_src_time     = 10
    max_fails             = 3
    proxy_keepalive       = 1
  }
}

output "imported_resource_id" {
  description = "The ID of the imported resource"
  value       = byteshield_scdn_network_speed_config.example.id
}



