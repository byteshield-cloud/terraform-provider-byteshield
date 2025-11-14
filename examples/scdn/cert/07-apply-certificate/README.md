# Apply for SCDN Certificate

This example demonstrates how to apply for a SCDN certificate (e.g., Let's Encrypt) using Terraform.

## Prerequisites

- Terraform >= 1.0
- ByteShield account with API credentials
- Valid domain names that you own

## Files

- `main.tf` - Main Terraform configuration
- `terraform.tfvars.example` - Example variables file

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars`
2. Fill in your ByteShield API credentials and domain list
3. Run `terraform init` to initialize the provider
4. Run `terraform plan` to preview changes
5. Run `terraform apply` to apply for the certificate

## Variables

- `access_key` - ByteShield Access Key (required)
- `secret_key` - ByteShield Secret Key (required)
- `endpoint` - ByteShield SCDN API Endpoint (optional, defaults to https://apiv4.lalcsafe.com)
- `domains` - List of domains to apply for certificate (required)

## Outputs

- `certificate_application_id` - Certificate application resource ID
- `ca_id_domains` - Mapping of domain_id to domain
- `ca_id_names` - Mapping of ca_id to ca_name
- `domain_count` - Number of domains applied
- `certificate_ids` - List of certificate IDs created
- `certificate_names` - List of certificate names created

## Notes

- Certificate application is typically for Let's Encrypt or similar ACME certificates
- The certificate may take some time to be issued after application
- You can use the certificate IDs returned to bind certificates to domains
- Certificate applications are one-time operations and cannot be deleted via API

## Example

Apply for a certificate for a single domain:
```hcl
domains = [
  "example.com"
]
```

Apply for a certificate for multiple domains:
```hcl
domains = [
  "example.com",
  "www.example.com",
  "api.example.com"
]
```

