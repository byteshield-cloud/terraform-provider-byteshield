# Example 4: Query SCDN Cache Clean Tasks
# This example demonstrates how to query cache clean task list

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

variable "start_time" {
  description = "Start time, format: YYYY-MM-DD HH:II:SS"
  type        = string
  default     = null
}

variable "end_time" {
  description = "End time, format: YYYY-MM-DD HH:II:SS"
  type        = string
  default     = null
}

variable "status" {
  description = "Status: 1-executing, 2-completed"
  type        = string
  default     = null
}

# Query SCDN cache clean tasks
data "byteshield_scdn_cache_clean_tasks" "example" {
  page      = var.page
  per_page  = var.per_page
  start_time = var.start_time
  end_time   = var.end_time
  status     = var.status
}

output "total" {
  description = "Total number of tasks"
  value       = data.byteshield_scdn_cache_clean_tasks.example.total
}

output "tasks" {
  description = "Task list"
  value       = data.byteshield_scdn_cache_clean_tasks.example.tasks
}

