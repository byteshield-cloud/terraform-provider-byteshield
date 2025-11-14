# Example 2: Query Origin Group
# This example demonstrates how to query an origin group

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

variable "origin_group_id" {
  description = "Origin group ID"
  type        = number
}

# Query origin group
data "byteshield_scdn_origin_group" "example" {
  origin_group_id = var.origin_group_id
}

output "origin_group" {
  description = "Origin group details"
  value = {
    origin_group_id = data.byteshield_scdn_origin_group.example.origin_group_id
    name            = data.byteshield_scdn_origin_group.example.name
    remark          = data.byteshield_scdn_origin_group.example.remark
    member_id       = data.byteshield_scdn_origin_group.example.member_id
    created_at      = data.byteshield_scdn_origin_group.example.created_at
    origins         = data.byteshield_scdn_origin_group.example.origins
  }
}

