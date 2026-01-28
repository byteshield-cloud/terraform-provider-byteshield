---
subcategory: "Security DNS (SDNS)"
layout: "byteshield"
page_title: "ByteShield: byteshield_sdns_records"
sidebar_current: "docs-byteshield-datasource-sdns_records"
description: |-
  Use this data source to query a list of SDNS DNS records.
---

# byteshield_sdns_records

Use this data source to query a list of SDNS DNS records.

## Example Usage

### Query SDNS DNS records

```hcl
data "byteshield_sdns_records" "example" {
  domain_id = 12345
}
```

## Argument Reference

The following arguments are supported:

* `domain_id` - (Required, Int) Domain ID to list records for

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `records` - List of records in the domain


