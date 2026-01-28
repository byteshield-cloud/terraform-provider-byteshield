---
subcategory: "Security DNS (SDNS)"
layout: "byteshield"
page_title: "ByteShield: byteshield_sdns_domain_groups"
sidebar_current: "docs-byteshield-datasource-sdns_domain_groups"
description: |-
  Use this data source to query a list of SDNS domain groups.
---

# byteshield_sdns_domain_groups

Use this data source to query a list of SDNS domain groups.

## Example Usage

### Query SDNS domain groups

```hcl
data "byteshield_sdns_domain_groups" "example" {
  group_name = "my-domain-group"
}
```

## Argument Reference

The following arguments are supported:

* `group_name` - (Optional, String) Filter by group name

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `groups` - List of matched groups


