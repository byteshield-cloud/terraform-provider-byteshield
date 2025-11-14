# Example 4: Update Cache Rule Name/Remark
# This example demonstrates how to update a cache rule's name and remark

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
  description = "Business ID (template ID for 'tpl' type, domain ID for 'domain' type)"
  type        = number
}

variable "business_type" {
  description = "Business type: 'tpl' (template) or 'domain'"
  type        = string
  default     = "tpl"
}

variable "rule_id" {
  description = "Cache rule ID to update"
  type        = number
}

variable "rule_name" {
  description = "Updated cache rule name"
  type        = string
}

variable "remark" {
  description = "Updated rule remark"
  type        = string
  default     = ""
}

# Update cache rule name/remark
resource "byteshield_scdn_cache_rule" "example" {
  business_id   = var.business_id
  business_type = var.business_type
  rule_id       = var.rule_id
  name          = var.rule_name
  remark        = var.remark
  expr          = ""  # Empty string means "allow all" - this will be set to API

  conf {
    nocache = false  # Keep existing conf
    cache_share {
      scheme = "https"  # Keep existing conf
    }
    cache_rule {
      cachetime = 60
      ignore_cache_time = true
      ignore_nocache_header = true
      no_cache_control_op = "default"
      action = "force"
    }
    browser_cache_rule {
      cachetime = 60
      ignore_cache_time = true
      nocache = false
    }
    cache_errstatus {
      cachetime = 10
      err_status = [400, 401, 404, 500]
    }
    cache_errstatus {
      cachetime = 100
      err_status = [400, 403, 502, 503]
    }
    cache_url_rewrite {
      sort_args = true
      ignore_case = true
      queries {
        args_method = "SAVE"
        items = ["test"]
      }
      cookies {
        args_method = "IGNORE"
        items = ["test"]
      }
    }
  }
}

output "rule_id" {
  description = "Updated cache rule ID"
  value       = byteshield_scdn_cache_rule.example.id
}

output "rule_name" {
  description = "Updated cache rule name"
  value       = byteshield_scdn_cache_rule.example.name
}

