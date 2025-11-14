# Export SCDN Certificate

This example demonstrates how to export SCDN certificates using Terraform.

## Prerequisites

- Terraform >= 1.0
- ByteShield account with API credentials
- Valid certificate ID

## Files

- `main.tf` - Main Terraform configuration
- `terraform.tfvars.example` - Example variables file

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars`
2. Fill in your ByteShield API credentials and certificate ID
3. Run `terraform init` to initialize the provider
4. Run `terraform plan` to preview changes
5. Run `terraform apply` to export the certificate

## Variables

- `access_key` - ByteShield Access Key (required)
- `secret_key` - ByteShield Secret Key (required)
- `endpoint` - ByteShield SCDN API Endpoint (optional, defaults to https://apiv4.lalcsafe.com)
- `certificate_id` - Certificate ID to export, can be a single ID or comma-separated IDs (required)
- `product_flag` - Product flag (optional)

## Outputs

- `exports` - List of exported certificate data
- `export_count` - Number of exports
- `export_urls` - Export download URLs
- `export_details` - Detailed export information including hash, key, and real_url

## Example

Export a single certificate:
```hcl
certificate_id = "123"
```

Export multiple certificates:
```hcl
certificate_id = "123,456,789"
```

