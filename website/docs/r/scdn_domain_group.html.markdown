---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_domain_group"
sidebar_current: "docs-byteshield-resource-scdn_domain_group"
description: |-
  # byteshield_scdn_domain_group
---

# byteshield_scdn_domain_group

# byteshield_scdn_domain_group

Manages an SCDN Domain Group.

## Example Usage

### Create a domain group

```hcl
resource "byteshield_scdn_domain_group" "example" {
  group_name = "my-domain-group"
  remark     = "Production domains"
  domains    = ["example.com", "www.example.com"]
}
```

## Argument Reference

The following arguments are supported:

* `group_name` - (Required, String) The name of the domain group
* `domain_ids` - (Optional, Set: [`String`]) List of domain IDs to bind to the group
* `domains` - (Optional, Set: [`String`]) List of domains to bind to the group
* `remark` - (Optional, String) Remark for the domain group

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `id` - ID of the resource.
* `created_at` - Creation time
* `updated_at` - Last update time


## Import

SCDN Domain Groups can be imported using the group ID, e.g.

```
$ terraform import byteshield_scdn_domain_group.example 123
```

