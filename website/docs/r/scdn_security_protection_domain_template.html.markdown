---
subcategory: "Security CDN (SCDN)"
layout: "byteshield"
page_title: "ByteShield: byteshield_scdn_security_protection_domain_template"
sidebar_current: "docs-byteshield-resource-scdn_security_protection_domain_template"
description: |-
  Provides a resource to create a domain-level security protection template.
---

# byteshield_scdn_security_protection_domain_template

Provides a resource to create a domain-level security protection template.

This resource creates a domain-level security protection template for a single domain. Unlike the multi-domain template (`byteshield_scdn_security_protection_template`), this resource:
- Only supports creation for a single domain, not update
- Deletion rebinds the domain to the global template
- Requires `template_source_id` (obtained from global template data source)

## Example Usage

### Create single domain template

```hcl
# First, get the global template ID
data "byteshield_scdn_security_protection_member_global_template" "global" {}

# Create a domain template for a single domain
resource "byteshield_scdn_security_protection_domain_template" "example" {
  domain_id          = 12345
  template_source_id = data.byteshield_scdn_security_protection_member_global_template.global.template[0].id
}
```

### Complete example with domain data source

```hcl
# Get domain information
data "byteshield_scdn_domains" "example" {
  domain = "example.com"
}

# Get the global template ID
data "byteshield_scdn_security_protection_member_global_template" "global" {}

# Create a domain template
resource "byteshield_scdn_security_protection_domain_template" "example" {
  domain_id          = data.byteshield_scdn_domains.example.domains[0].id
  template_source_id = data.byteshield_scdn_security_protection_member_global_template.global.template[0].id
}
```

## Argument Reference

The following arguments are supported:

* `domain_id` - (Required, Int, ForceNew) Domain ID to create template for.
* `template_source_id` - (Required, Int, ForceNew) Source template ID. Use data source byteshield_scdn_security_protection_member_global_template to get the global template ID.

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `id` - ID of the resource.
* `business_id` - Created business ID (template ID) for the domain.


## Import

Domain templates can be imported using the resource ID:

```shell
terraform import byteshield_scdn_security_protection_domain_template.example domain-template-12345

