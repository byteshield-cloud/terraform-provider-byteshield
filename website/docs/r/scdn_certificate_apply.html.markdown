---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_certificate_apply"
sidebar_current: "docs-byteshield-resource-scdn_certificate_apply"
description: |-
  Provides a resource to apply for SCDN certificates for domains.
---

# byteshield_scdn_certificate_apply

Provides a resource to apply for SCDN certificates for domains.

## Example Usage

### Apply certificate for single domain

```hcl
resource "byteshield_scdn_certificate_apply" "example" {
  domain = ["example.com"]
}
```

### Apply certificate for multiple domains

```hcl
resource "byteshield_scdn_certificate_apply" "example" {
  domain = ["example.com", "www.example.com", "api.example.com"]
}
```

## Argument Reference

The following arguments are supported:

* `domain` - (Required, List: [`String`], ForceNew) The list of domains to apply for certificate

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `id` - ID of the resource.
* `ca_id_domains` - The mapping of domain_id to domain
* `ca_id_names` - The mapping of ca_id to ca_name
* `id` - The ID of the certificate application


## Import

SCDN certificate applications can be imported using the certificate application ID:

```shell
terraform import byteshield_scdn_certificate_apply.example 12345
```

