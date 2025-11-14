---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_domain_access_mode"
sidebar_current: "docs-byteshield-resource-scdn_domain_access_mode"
description: |-
  Provides a resource to switch the access mode of an SCDN domain.
---

# byteshield_scdn_domain_access_mode

Provides a resource to switch the access mode of an SCDN domain.

## Example Usage

### Switch to CNAME access mode

```hcl
resource "byteshield_scdn_domain_access_mode" "example" {
  domain_id   = 12345
  access_mode = "cname"
}
```

### Switch to NS access mode

```hcl
resource "byteshield_scdn_domain_access_mode" "example" {
  domain_id   = 12345
  access_mode = "ns"
}
```

## Argument Reference

The following arguments are supported:

* `access_mode` - (Required, String) The access mode. Valid values: ns, cname
* `domain_id` - (Required, Int, ForceNew) The ID of the domain to switch access mode

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `id` - ID of the resource.



## Import

SCDN domain access mode can be imported using the domain ID:

```shell
terraform import byteshield_scdn_domain_access_mode.example 12345
```

