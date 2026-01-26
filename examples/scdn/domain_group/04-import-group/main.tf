terraform {
  required_providers {
    byteshield = {
      source  = "byteshield-cloud/byteshield"
      version = "0.2.1"
    }
  }
}

provider "byteshield" {
  access_key = var.access_key
  secret_key = var.secret_key
  endpoint   = var.endpoint
}

variable "access_key" {
  type        = string
  description = "Byteshield access key"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "Byteshield secret key"
  sensitive   = true
}

variable "endpoint" {
  type        = string
  description = "Byteshield API endpoint"
  default     = "https://apiv4.lalcsafe.com"
}

variable "group_id" {
  type        = string
  description = "The ID of the domain group to import"
}

# This resource will be imported from an existing domain group
# Run: terraform import byteshield_scdn_domain_group.imported <group_id>
resource "byteshield_scdn_domain_group" "imported" {
  # These values will be populated from the import
  # You can modify them after import
  group_name = "imported-group-name"
  remark     = "Imported and managed by Terraform"

  # Optionally manage domains
  # domains = ["example.com"]
}

# Query the imported group's domains
data "byteshield_scdn_domain_group_domains" "imported_domains" {
  group_id   = tonumber(var.group_id)
  depends_on = [byteshield_scdn_domain_group.imported]
}

output "group_info" {
  value = {
    id         = byteshield_scdn_domain_group.imported.id
    name       = byteshield_scdn_domain_group.imported.group_name
    remark     = byteshield_scdn_domain_group.imported.remark
    created_at = byteshield_scdn_domain_group.imported.created_at
    updated_at = byteshield_scdn_domain_group.imported.updated_at
  }
  description = "Imported group information"
}

output "group_domains" {
  value       = data.byteshield_scdn_domain_group_domains.imported_domains.list
  description = "Domains in the imported group"
}
