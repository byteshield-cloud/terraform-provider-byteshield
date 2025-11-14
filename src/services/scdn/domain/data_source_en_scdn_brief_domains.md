Use this data source to query brief information of SCDN domains.

Example Usage

Query all brief domains

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

Query specific domains by IDs

```hcl
data "byteshield_scdn_brief_domains" "specific" {
  ids = [12345, 67890, 11111]
}

output "selected_domains" {
  value = data.byteshield_scdn_brief_domains.specific.list
}
```

Query and save to file

```hcl
data "byteshield_scdn_brief_domains" "all" {
  result_output_file = "brief_domains.json"
}
```

