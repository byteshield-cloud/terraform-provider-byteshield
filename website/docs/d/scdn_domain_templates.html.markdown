---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_domain_templates"
sidebar_current: "docs-byteshield-datasource-scdn_domain_templates"
description: |-
  Use this data source to query templates bound to a specific SCDN domain.
---

# byteshield_scdn_domain_templates

Use this data source to query templates bound to a specific SCDN domain.

## Example Usage

### Query domain templates

```hcl
data "byteshield_scdn_domain_templates" "example" {
  domain_id = 12345
}

output "binded_templates" {
  value = data.byteshield_scdn_domain_templates.example.binded_templates
}
```

### Query and save to file

```hcl
data "byteshield_scdn_domain_templates" "example" {
  domain_id          = 12345
  result_output_file = "templates.json"
}
```

## Argument Reference

The following arguments are supported:

* `domain_id` - (Required, Int) The ID of the domain to query templates
* `result_output_file` - (Optional, String) Used to save results to a file

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `binded_templates` - List of binded templates
  * `app_type` - Application type
  * `business_id` - Business ID
  * `business_type` - Business type
  * `name` - Template name


