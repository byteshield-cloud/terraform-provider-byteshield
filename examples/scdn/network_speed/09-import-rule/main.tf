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

resource "byteshield_scdn_cache_rule" "example" {
  name = "no-cache-rule1111"
  expr = "(http.request.uri.path eq \"/api/get_user\")"

  conf {
    nocache = true
  }
}


resource "byteshield_scdn_network_speed_rule" "example" {
  customized_req_headers_rule {
    type    = "add"
    content = "X-Test-Header: 1111"
    remark  = "testing drift fixads aa"
  }
}
