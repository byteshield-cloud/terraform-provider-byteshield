---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_domain_groups"
sidebar_current: "docs-byteshield-datasource-scdn_domain_groups"
description: |-
  # byteshield_scdn_domain_groups
---

# byteshield_scdn_domain_groups

# byteshield_scdn_domain_groups

Query SCDN Domain Groups.

## Example Usage

### Query domain groups by name

```hcl
data "byteshield_scdn_domain_groups" "example" {
  group_name = "my-domain-group"
}

output "groups" {
  value = data.byteshield_scdn_domain_groups.example.list
}
```

## Argument Reference

The following arguments are supported:

* `domain` - (Optional, String) Filter by domain
* `group_name` - (Optional, String) Filter by group name
* `page` - (Optional, Int) Page number
* `per_page` - (Optional, Int) Items per page

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `list` - List of domain groups
  * `created_at` - Created At
  * `group_name` - Group Name
  * `id` - Group ID
  * `remark` - Remark
  * `updated_at` - Updated At
* `total` - Total count


