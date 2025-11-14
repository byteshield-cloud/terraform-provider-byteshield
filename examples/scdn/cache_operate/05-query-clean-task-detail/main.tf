# Example 5: Query SCDN Cache Clean Task Detail
# This example demonstrates how to query cache clean task detail

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

variable "task_id" {
  description = "Task ID"
  type        = number
}

variable "page" {
  description = "Page number"
  type        = number
  default     = 1
}

variable "per_page" {
  description = "Items per page"
  type        = number
  default     = 20
}

variable "result" {
  description = "Result filter: 1-success, 2-failed, 3-executing"
  type        = number
  default     = null
}

# Query SCDN cache clean task detail
data "byteshield_scdn_cache_clean_task_detail" "example" {
  task_id  = var.task_id
  page     = var.page
  per_page = var.per_page
  result   = var.result
}

output "total" {
  description = "Total number of tasks"
  value       = data.byteshield_scdn_cache_clean_task_detail.example.total
}

output "details" {
  description = "Task detail list"
  value       = data.byteshield_scdn_cache_clean_task_detail.example.details
}

