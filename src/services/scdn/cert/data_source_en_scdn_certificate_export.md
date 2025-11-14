Use this data source to export SCDN certificates.

Example Usage

Export certificate

```hcl
data "byteshield_scdn_certificate_export" "example" {
  id = "12345"
}

output "export_url" {
  value = data.byteshield_scdn_certificate_export.example.exports[0].real_url
}
```

Export multiple certificates

```hcl
data "byteshield_scdn_certificate_export" "example" {
  id = "12345,67890"
}

output "exports" {
  value = data.byteshield_scdn_certificate_export.example.exports
}
```

Query and save to file

```hcl
data "byteshield_scdn_certificate_export" "example" {
  id                = "12345"
  result_output_file = "certificate_export.json"
}
```

