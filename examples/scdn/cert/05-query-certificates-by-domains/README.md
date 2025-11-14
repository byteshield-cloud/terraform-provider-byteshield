# Query SCDN Certificates by Domains

This example demonstrates how to query SCDN certificates by a list of domains using Terraform.

## Prerequisites

- Terraform >= 1.0
- ByteShield account with API credentials

## Files

- `main.tf` - Main Terraform configuration
- `terraform.tfvars.example` - Example variables file

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars`
2. Fill in your ByteShield API credentials and domain list
3. Run `terraform init` to initialize the provider
4. Run `terraform plan` to preview changes
5. Run `terraform apply` to query certificates

## Variables

- `access_key` - ByteShield Access Key (required)
- `secret_key` - ByteShield Secret Key (required)
- `endpoint` - ByteShield SCDN API Endpoint (optional, defaults to https://apiv4.lalcsafe.com)
- `domains` - List of domain names to query certificates for (required)

## Outputs

- `certificates` - List of certificates for the specified domains
- `certificate_count` - Number of certificates found
- `certificate_details` - Detailed information about certificates

## Example

```hcl
domains = [
  "example.com",
  "test.com"
]
```

