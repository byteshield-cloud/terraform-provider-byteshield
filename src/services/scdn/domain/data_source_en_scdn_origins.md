Use this data source to query a list of SCDN origin servers for a domain.

Example Usage

Query all origins for a domain

```hcl
data "byteshield_scdn_origins" "example" {
  domain_id = 12345
}

output "origin_count" {
  value = data.byteshield_scdn_origins.example.total
}

output "origin_details" {
  value = data.byteshield_scdn_origins.example.origins
}
```

Query origins and save to file

```hcl
data "byteshield_scdn_origins" "example" {
  domain_id         = 12345
  result_output_file = "origins.json"
}
```
