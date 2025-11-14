---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_brief_domains"
sidebar_current: "docs-byteshield-datasource-scdn_brief_domains"
description: |-
  Use this data source to query brief information of SCDN domains.
---

# byteshield_scdn_brief_domains

Use this data source to query brief information of SCDN domains.

## Example Usage

### Query all brief domains

```hcl
data "byteshield_scdn_brief_domains" "all" {
}

output "domain_list" {
  value = data.byteshield_scdn_brief_domains.all.list
}

output "total_domains" {
  value = data.byteshield_scdn_brief_domains.all.total
}
```

### Query specific domains by IDs

```hcl
data "byteshield_scdn_brief_domains" "specific" {
  ids = [12345, 67890, 11111]
}

output "selected_domains" {
  value = data.byteshield_scdn_brief_domains.specific.list
}
```

### Query and save to file

```hcl
data "byteshield_scdn_brief_domains" "all" {
  result_output_file = "brief_domains.json"
}
```

## Argument Reference

The following arguments are supported:

* `ids` - (Optional, List: [`Int`]) List of domain IDs to query (optional, queries all if not specified)
* `result_output_file` - (Optional, String) Used to save results to a file

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `list` - List of brief domain information
  * `domain` - Domain name
  * `id` - Domain ID
* `total` - Total number of domains


