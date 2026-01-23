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


# Query the Items in the list using a variable ID
variable "user_ip_id" {
  description = "The ID of the User IP List to query"
  type        = number
}

data "byteshield_scdn_user_ip_items" "items" {
  user_ip_id = var.user_ip_id
  page       = 1
  per_page   = 10
}


output "queried_items" {
  value = data.byteshield_scdn_user_ip_items.items.items
}

output "total_count" {
  value = data.byteshield_scdn_user_ip_items.items.total
}
