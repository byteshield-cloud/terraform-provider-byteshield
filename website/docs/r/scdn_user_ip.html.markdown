---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_user_ip"
sidebar_current: "docs-byteshield-resource-scdn_user_ip"
description: |-
  # byteshield_scdn_user_ip
---

# byteshield_scdn_user_ip

# byteshield_scdn_user_ip

Provides a resource to manage SCDN User IP Lists. This resource allows you to create, update, and delete IP address lists that can be used in various SCDN configurations.

## Example Usage

### Create a user IP list

```hcl
resource "byteshield_scdn_user_ip" "example" {
  name      = "example-ip-list"
  remark    = "Managed by Terraform"
  file_path = "${path.module}/ip_list.txt"
}
```

## Argument Reference

The following arguments are supported:

* `name` - (Required, String) The name of the IP list
* `file_path` - (Optional, String) The path to the file containing IP list to upload
* `remark` - (Optional, String) The remark/description for the IP list

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `created_at` - Creation time
* `id` - The ID of the IP list
* `item_num` - Number of IPs in the list
* `updated_at` - Last update time


## Import

SCDN User IP Lists can be imported using the `id`, e.g.

```
$ terraform import byteshield_scdn_user_ip.example 123
```

