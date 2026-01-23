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

variable "user_ip_id" {
  description = "The ID of the User IP List where the item belongs"
  type        = number
}

variable "item_id" {
  description = "The UUID of the IP Item to import/modify"
  type        = string
}

# 1. Define the resource to correspond to the existing item
# To modify an existing item, you must import it first.
# Usage:
#   terraform init
#   terraform import byteshield_scdn_user_ip_item.modify_demo <ITEM_UUID>
#   terraform apply
resource "byteshield_scdn_user_ip_item" "modify_demo" {
  user_ip_id = var.user_ip_id

  # Note: 'ip' is required by the schema. 
  # If you are modifying just the remark, you must still provide the IP 2 verify or keep it same.
  # If you are modifying the IP, change it here.
  ip = "1.2.3.4"

  remark = "Modified via Terraform"
}

output "item_id" {
  value = byteshield_scdn_user_ip_item.modify_demo.id
}
