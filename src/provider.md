---
layout: "byteshield"
page_title: "Provider: ByteShield"
sidebar_current: "docs-byteshield-index"
description: |-
  The ByteShield provider is used to interact with ByteShield services.
---

# ByteShield Provider

The ByteShield Provider can be used to configure infrastructure in [ByteShield](https://www.byteshield.com) using the ByteShield Resource Manager API's. Documentation regarding the Data Sources and Resources supported by the ByteShield Provider can be found in the navigation to the left.

-> **Note:** This provider requires ByteShield API credentials (access key and secret key).

## Example Usage

```hcl
terraform {
  required_providers {
    byteshield = {
      source  = "byteshield-cloud/byteshield"
      version = "~> 1.0"
    }
  }
}

# Configure the ByteShield Provider
provider "byteshield" {
  access_key = var.access_key
  secret_key = var.secret_key
  endpoint   = var.endpoint
  region     = var.region
}
```

## Authentication

The ByteShield provider offers a flexible means of providing credentials for authentication. The following methods are supported, in order of precedence:

1. **Static credentials** in the provider configuration block
2. **Environment variables**

### Static Credentials

!> **Warning:** Hard-coding credentials into any Terraform configuration is not recommended, and risks secret leakage should this file ever be committed to a public version control system.

Static credentials can be provided by adding `access_key` and `secret_key` in-line in the ByteShield provider block:

```hcl
provider "byteshield" {
  access_key = "your-access-key"
  secret_key = "your-secret-key"
  endpoint   = "https://api.byteshield.com"
  region     = "us-east-1"
}
```

### Environment Variables

You can provide your credentials via the `BYTESHIELD_ACCESS_KEY`, `BYTESHIELD_SECRET_KEY`, `BYTESHIELD_ENDPOINT` and `BYTESHIELD_REGION` environment variables:

```hcl
provider "byteshield" {}
```

Usage:

```bash
export BYTESHIELD_ACCESS_KEY="your-access-key"
export BYTESHIELD_SECRET_KEY="your-secret-key"
export BYTESHIELD_ENDPOINT="https://api.byteshield.com"
export BYTESHIELD_REGION="us-east-1"
terraform plan
```

## Argument Reference

The following arguments are supported in the `provider` block:

* `access_key` - (Required) ByteShield access key for authentication. It can also be sourced from the `BYTESHIELD_ACCESS_KEY` environment variable.

* `secret_key` - (Required) ByteShield secret key for authentication. It can also be sourced from the `BYTESHIELD_SECRET_KEY` environment variable.

* `endpoint` - (Required) ByteShield API endpoint address. It can also be sourced from the `BYTESHIELD_ENDPOINT` environment variable.

* `region` - (Optional) ByteShield region. It can also be sourced from the `BYTESHIELD_REGION` environment variable.

Resources List

Security CDN (SCDN)
Data Source
byteshield_scdn_domain
byteshield_scdn_domains
byteshield_scdn_origin
byteshield_scdn_origins
byteshield_scdn_domain_base_settings
byteshield_scdn_access_progress
byteshield_scdn_domain_templates
byteshield_scdn_brief_domains
byteshield_scdn_certificate
byteshield_scdn_certificates
byteshield_scdn_certificates_by_domains
byteshield_scdn_certificate_export
byteshield_scdn_rule_template
byteshield_scdn_rule_templates
byteshield_scdn_rule_template_domains
byteshield_scdn_network_speed_config
byteshield_scdn_network_speed_rules
byteshield_scdn_cache_rules
byteshield_scdn_cache_global_config
byteshield_scdn_security_protection_ddos_config
byteshield_scdn_security_protection_waf_config
byteshield_scdn_security_protection_template
byteshield_scdn_security_protection_templates
byteshield_scdn_security_protection_template_domains
byteshield_scdn_security_protection_template_unbound_domains
byteshield_scdn_security_protection_member_global_template
byteshield_scdn_security_protection_iota
byteshield_scdn_origin_group
byteshield_scdn_origin_groups
byteshield_scdn_origin_groups_all
byteshield_scdn_cache_clean_config
byteshield_scdn_cache_clean_tasks
byteshield_scdn_cache_clean_task_detail
byteshield_scdn_cache_preheat_tasks
byteshield_scdn_log_download_tasks
byteshield_scdn_log_download_templates
byteshield_scdn_log_download_fields

Resource
byteshield_scdn_domain
byteshield_scdn_origin
byteshield_scdn_cert_binding
byteshield_scdn_domain_base_settings
byteshield_scdn_domain_status
byteshield_scdn_domain_node_switch
byteshield_scdn_domain_access_mode
byteshield_scdn_certificate
byteshield_scdn_certificate_apply
byteshield_scdn_rule_template
byteshield_scdn_rule_template_domain_bind
byteshield_scdn_rule_template_domain_unbind
byteshield_scdn_network_speed_config
byteshield_scdn_network_speed_rule
byteshield_scdn_network_speed_rules_sort
byteshield_scdn_cache_rule
byteshield_scdn_cache_rule_status
byteshield_scdn_cache_rules_sort
byteshield_scdn_security_protection_ddos_config
byteshield_scdn_security_protection_waf_config
byteshield_scdn_security_protection_template
byteshield_scdn_security_protection_template_domain_bind
byteshield_scdn_security_protection_template_batch_config
byteshield_scdn_origin_group
byteshield_scdn_origin_group_domain_bind
byteshield_scdn_origin_group_domain_copy
byteshield_scdn_cache_clean_task
byteshield_scdn_cache_preheat_task
byteshield_scdn_log_download_task
byteshield_scdn_log_download_template
byteshield_scdn_log_download_template_status
