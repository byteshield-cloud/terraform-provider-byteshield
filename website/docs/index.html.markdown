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

## Resources and Data Sources

The ByteShield provider supports the following resource types:

### Security CDN (SCDN)

#### Access

##### Data Sources

* [`byteshield_scdn_access_progress`](data-sources/scdn_access_progress) - Query SCDN access progress options

#### Brief

##### Data Sources

* [`byteshield_scdn_brief_domains`](data-sources/scdn_brief_domains) - Query SCDN brief domain information

#### Cache

##### Resources

* [`byteshield_scdn_cache_clean_task`](resources/scdn_cache_clean_task) - Manage SCDN cache clean tasks
* [`byteshield_scdn_cache_preheat_task`](resources/scdn_cache_preheat_task) - Manage SCDN cache preheat tasks
* [`byteshield_scdn_cache_rule`](resources/scdn_cache_rule) - Manage SCDN cache rules
* [`byteshield_scdn_cache_rule_status`](resources/scdn_cache_rule_status) - Manage SCDN cache rule status
* [`byteshield_scdn_cache_rules_sort`](resources/scdn_cache_rules_sort) - Manage SCDN cache rules sorting

##### Data Sources

* [`byteshield_scdn_cache_clean_config`](data-sources/scdn_cache_clean_config) - Query SCDN cache clean configuration
* [`byteshield_scdn_cache_clean_task_detail`](data-sources/scdn_cache_clean_task_detail) - Query SCDN cache clean task details
* [`byteshield_scdn_cache_clean_tasks`](data-sources/scdn_cache_clean_tasks) - Query SCDN cache clean tasks
* [`byteshield_scdn_cache_global_config`](data-sources/scdn_cache_global_config) - Query SCDN cache global configuration
* [`byteshield_scdn_cache_preheat_tasks`](data-sources/scdn_cache_preheat_tasks) - Query SCDN cache preheat tasks
* [`byteshield_scdn_cache_rules`](data-sources/scdn_cache_rules) - Query SCDN cache rules

#### Certificate

##### Resources

* [`byteshield_scdn_cert_binding`](resources/scdn_cert_binding) - Manage SCDN certificate bindings
* [`byteshield_scdn_certificate`](resources/scdn_certificate) - Manage SCDN certificates
* [`byteshield_scdn_certificate_apply`](resources/scdn_certificate_apply) - Manage SCDN certificate application

##### Data Sources

* [`byteshield_scdn_certificate`](data-sources/scdn_certificate) - Query SCDN certificate details
* [`byteshield_scdn_certificate_export`](data-sources/scdn_certificate_export) - Query SCDN certificate export
* [`byteshield_scdn_certificates`](data-sources/scdn_certificates) - Query SCDN certificates
* [`byteshield_scdn_certificates_by_domains`](data-sources/scdn_certificates_by_domains) - Query SCDN certificates by domains

#### Domain

##### Resources

* [`byteshield_scdn_domain`](resources/scdn_domain) - Manage SCDN domain configuration
* [`byteshield_scdn_domain_access_mode`](resources/scdn_domain_access_mode) - Manage SCDN domain access mode
* [`byteshield_scdn_domain_base_settings`](resources/scdn_domain_base_settings) - Manage SCDN domain base settings
* [`byteshield_scdn_domain_node_switch`](resources/scdn_domain_node_switch) - Manage SCDN domain node switching
* [`byteshield_scdn_domain_status`](resources/scdn_domain_status) - Manage SCDN domain status management

##### Data Sources

* [`byteshield_scdn_domain`](data-sources/scdn_domain) - Query SCDN domain details
* [`byteshield_scdn_domain_base_settings`](data-sources/scdn_domain_base_settings) - Query SCDN domain base settings
* [`byteshield_scdn_domain_templates`](data-sources/scdn_domain_templates) - Query SCDN domain templates
* [`byteshield_scdn_domains`](data-sources/scdn_domains) - Query SCDN domains

#### Log Download

##### Resources

* [`byteshield_scdn_log_download_task`](resources/scdn_log_download_task) - Manage SCDN log download tasks
* [`byteshield_scdn_log_download_template`](resources/scdn_log_download_template) - Manage SCDN log download templates
* [`byteshield_scdn_log_download_template_status`](resources/scdn_log_download_template_status) - Manage SCDN log download template status

##### Data Sources

* [`byteshield_scdn_log_download_fields`](data-sources/scdn_log_download_fields) - Query SCDN log download fields
* [`byteshield_scdn_log_download_tasks`](data-sources/scdn_log_download_tasks) - Query SCDN log download tasks
* [`byteshield_scdn_log_download_templates`](data-sources/scdn_log_download_templates) - Query SCDN log download templates

#### Network Speed

##### Resources

* [`byteshield_scdn_network_speed_config`](resources/scdn_network_speed_config) - Manage SCDN network speed configuration
* [`byteshield_scdn_network_speed_rule`](resources/scdn_network_speed_rule) - Manage SCDN network speed rules
* [`byteshield_scdn_network_speed_rules_sort`](resources/scdn_network_speed_rules_sort) - Manage SCDN network speed rules sorting

##### Data Sources

* [`byteshield_scdn_network_speed_config`](data-sources/scdn_network_speed_config) - Query SCDN network speed configuration
* [`byteshield_scdn_network_speed_rules`](data-sources/scdn_network_speed_rules) - Query SCDN network speed rules

#### Origin

##### Resources

* [`byteshield_scdn_origin`](resources/scdn_origin) - Manage SCDN origin servers

##### Data Sources

* [`byteshield_scdn_origin`](data-sources/scdn_origin) - Query SCDN origin details
* [`byteshield_scdn_origins`](data-sources/scdn_origins) - Query SCDN origins

#### Origin Group

##### Resources

* [`byteshield_scdn_origin_group`](resources/scdn_origin_group) - Manage SCDN origin groups
* [`byteshield_scdn_origin_group_domain_bind`](resources/scdn_origin_group_domain_bind) - Manage SCDN origin group domain bindings
* [`byteshield_scdn_origin_group_domain_copy`](resources/scdn_origin_group_domain_copy) - Manage SCDN origin group domain copying

##### Data Sources

* [`byteshield_scdn_origin_group`](data-sources/scdn_origin_group) - Query SCDN origin group details
* [`byteshield_scdn_origin_groups`](data-sources/scdn_origin_groups) - Query SCDN origin groups
* [`byteshield_scdn_origin_groups_all`](data-sources/scdn_origin_groups_all) - Query SCDN all origin groups

#### Rule Template

##### Resources

* [`byteshield_scdn_rule_template`](resources/scdn_rule_template) - Manage SCDN rule templates
* [`byteshield_scdn_rule_template_domain_bind`](resources/scdn_rule_template_domain_bind) - Manage SCDN rule template domain bindings
* [`byteshield_scdn_rule_template_domain_unbind`](resources/scdn_rule_template_domain_unbind) - Manage SCDN rule template domain unbindings

##### Data Sources

* [`byteshield_scdn_rule_template`](data-sources/scdn_rule_template) - Query SCDN rule template details
* [`byteshield_scdn_rule_template_domains`](data-sources/scdn_rule_template_domains) - Query SCDN rule template domains
* [`byteshield_scdn_rule_templates`](data-sources/scdn_rule_templates) - Query SCDN rule templates

#### Security Protection

##### Resources

* [`byteshield_scdn_security_protection_ddos_config`](resources/scdn_security_protection_ddos_config) - Manage SCDN DDoS protection configuration
* [`byteshield_scdn_security_protection_template`](resources/scdn_security_protection_template) - Manage SCDN security protection templates
* [`byteshield_scdn_security_protection_template_batch_config`](resources/scdn_security_protection_template_batch_config) - Manage SCDN security protection template batch configuration
* [`byteshield_scdn_security_protection_template_domain_bind`](resources/scdn_security_protection_template_domain_bind) - Manage SCDN security protection template domain bindings
* [`byteshield_scdn_security_protection_waf_config`](resources/scdn_security_protection_waf_config) - Manage SCDN WAF protection configuration

##### Data Sources

* [`byteshield_scdn_security_protection_ddos_config`](data-sources/scdn_security_protection_ddos_config) - Query SCDN DDoS protection configuration
* [`byteshield_scdn_security_protection_iota`](data-sources/scdn_security_protection_iota) - Query SCDN security protection IOTA
* [`byteshield_scdn_security_protection_member_global_template`](data-sources/scdn_security_protection_member_global_template) - Query SCDN security protection member global template
* [`byteshield_scdn_security_protection_template`](data-sources/scdn_security_protection_template) - Query SCDN security protection template details
* [`byteshield_scdn_security_protection_template_domains`](data-sources/scdn_security_protection_template_domains) - Query SCDN security protection template domains
* [`byteshield_scdn_security_protection_template_unbound_domains`](data-sources/scdn_security_protection_template_unbound_domains) - Query SCDN security protection template unbound domains
* [`byteshield_scdn_security_protection_templates`](data-sources/scdn_security_protection_templates) - Query SCDN security protection templates
* [`byteshield_scdn_security_protection_waf_config`](data-sources/scdn_security_protection_waf_config) - Query SCDN WAF protection configuration

