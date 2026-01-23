# Example 1: Create SCDN User IP List
# This example demonstrates how to create a User IP List

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
  default     = "https://apiv4.lalcsafe.com/"
}

variable "name" {
  description = "IP List Name"
  type        = string
  default     = "terraform-example-ip-list"
}

variable "remark" {
  description = "IP List Remark"
  type        = string
  default     = "Created via Terraform"
}

resource "byteshield_scdn_user_ip" "example" {
  name   = var.name
  remark = var.remark
}

output "ip_list_id" {
  value = byteshield_scdn_user_ip.example.id
}

output "ip_list_name" {
  value = byteshield_scdn_user_ip.example.name
}
