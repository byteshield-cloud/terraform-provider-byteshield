Use this data source to query SCDN cache clean configuration.

Example Usage

Query cache clean config

```hcl
data "byteshield_scdn_cache_clean_config" "example" {
}

output "wholesite" {
  value = data.byteshield_scdn_cache_clean_config.example.wholesite
}

output "specialurl" {
  value = data.byteshield_scdn_cache_clean_config.example.specialurl
}
```

Query and save to file

```hcl
data "byteshield_scdn_cache_clean_config" "example" {
  result_output_file = "cache_clean_config.json"
}
```

