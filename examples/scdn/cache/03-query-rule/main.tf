# Example 3: Query Cache Rule
# This example demonstrates how to query a specific cache rule by id parameter

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
  description = "Cache rule ID to query"
  type        = number
}

# Query cache rule by rule_id (converted to id query parameter in API)
resource "byteshield_scdn_cache_rule" "example" {
  business_id   = var.business_id
  business_type = var.business_type
  rule_id       = var.rule_id
  name          = ""  # Will be read from API
  expr          = ""  # Will be read from API

  conf {
    nocache = false  # Will be read from API
    cache_share {
      scheme = "http"  # Will be read from API
    }
  }
}

output "rule" {
  description = "Cache rule details"
  value = {
    id     = byteshield_scdn_cache_rule.example.id
    name   = byteshield_scdn_cache_rule.example.name
    remark = byteshield_scdn_cache_rule.example.remark
    expr   = byteshield_scdn_cache_rule.example.expr
    status = byteshield_scdn_cache_rule.example.status
    weight = byteshield_scdn_cache_rule.example.weight
    type   = byteshield_scdn_cache_rule.example.type
    conf = length(byteshield_scdn_cache_rule.example.conf) > 0 ? {
      nocache            = byteshield_scdn_cache_rule.example.conf[0].nocache
      cache_rule         = length(byteshield_scdn_cache_rule.example.conf[0].cache_rule) > 0 ? byteshield_scdn_cache_rule.example.conf[0].cache_rule[0] : null
      browser_cache_rule = length(byteshield_scdn_cache_rule.example.conf[0].browser_cache_rule) > 0 ? byteshield_scdn_cache_rule.example.conf[0].browser_cache_rule[0] : null
      cache_errstatus    = byteshield_scdn_cache_rule.example.conf[0].cache_errstatus
      cache_url_rewrite   = length(byteshield_scdn_cache_rule.example.conf[0].cache_url_rewrite) > 0 ? byteshield_scdn_cache_rule.example.conf[0].cache_url_rewrite[0] : null
      cache_share         = length(byteshield_scdn_cache_rule.example.conf[0].cache_share) > 0 ? byteshield_scdn_cache_rule.example.conf[0].cache_share[0] : null
    } : null
  }
}
