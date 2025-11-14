---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_security_protection_iota"
sidebar_current: "docs-byteshield-datasource-scdn_security_protection_iota"
description: |-
  Use this data source to query SCDN security protection IOTA (enum key-value pairs).
---

# byteshield_scdn_security_protection_iota

Use this data source to query SCDN security protection IOTA (enum key-value pairs).

## Example Usage

### Query IOTA

```hcl
data "byteshield_scdn_security_protection_iota" "example" {
}

output "iota" {
  value = data.byteshield_scdn_security_protection_iota.example.iota
}
```

### Query and save to file

```hcl
data "byteshield_scdn_security_protection_iota" "example" {
  result_output_file = "iota.json"
}
```

## Argument Reference

The following arguments are supported:

* `result_output_file` - (Optional, String) Used to save results to a file

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `iota` - Enum key-value pairs


