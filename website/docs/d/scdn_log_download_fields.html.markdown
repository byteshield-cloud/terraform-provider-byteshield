---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_log_download_fields"
sidebar_current: "docs-byteshield-datasource-scdn_log_download_fields"
description: |-
  Use this data source to query available SCDN log download fields.
---

# byteshield_scdn_log_download_fields

Use this data source to query available SCDN log download fields.

## Example Usage

### Query all log download fields

```hcl
data "byteshield_scdn_log_download_fields" "all" {
}

output "field_configs" {
  value = data.byteshield_scdn_log_download_fields.all.configs
}
```

### Query fields for specific data source

```hcl
data "byteshield_scdn_log_download_fields" "ng" {
  data_source = "ng"
}

output "ng_fields" {
  value = data.byteshield_scdn_log_download_fields.ng.configs
}
```

### Query and save to file

```hcl
data "byteshield_scdn_log_download_fields" "all" {
  result_output_file = "log_download_fields.json"
}
```

## Argument Reference

The following arguments are supported:

* `data_source` - (Optional, String) Filter by data source: ng, cc, waf. If not specified, returns all data sources
* `result_output_file` - (Optional, String) Used to save results to a file

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `configs` - Field configurations by data source
  * `data_source` - Data source key: ng, cc, waf
  * `download_fields` - Available download fields
  * `name` - Data source name
  * `search_terms` - Available search terms


