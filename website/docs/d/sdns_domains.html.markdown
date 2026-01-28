---
subcategory: "Security DNS (SDNS)"
layout: "byteshield"
page_title: "ByteShield: byteshield_sdns_domains"
sidebar_current: "docs-byteshield-datasource-sdns_domains"
description: |-
  Use this data source to query a list of SDNS domains.
---

# byteshield_sdns_domains

Use this data source to query a list of SDNS domains.

## Example Usage

### Query SDNS domains

```hcl
data "byteshield_sdns_domains" "example" {
  domain = "example.com"
}
```

## Argument Reference

The following arguments are supported:

* `domain` - (Optional, String) Filter by domain name

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `domains` - List of matched domains


