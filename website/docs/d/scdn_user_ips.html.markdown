---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_user_ips"
sidebar_current: "docs-byteshield-datasource-scdn_user_ips"
description: |-
  # byteshield_scdn_user_ips
---

# byteshield_scdn_user_ips

# byteshield_scdn_user_ips

Use this data source to query SCDN User IP Lists.

## Example Usage

### Query all user IP lists

```hcl
data "byteshield_scdn_user_ips" "all" {
  page     = 1
  per_page = 10
}

output "ip_lists" {
  value = data.byteshield_scdn_user_ips.all.items
}
```

## Argument Reference

The following arguments are supported:

* `page` - (Optional, Int) Page number
* `per_page` - (Optional, Int) Items per page

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `items` - List of user IP lists
  * `created_at` - Created At
  * `id` - ID
  * `item_num` - Item Num
  * `name` - Name
  * `remark` - Remark
  * `updated_at` - Updated At
* `total` - Total count


