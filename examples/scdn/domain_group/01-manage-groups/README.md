# SCDN Domain Group Management Example

This example demonstrates how to manage SCDN Domain Groups using the Byteshield Terraform provider.

## Features

- Create a domain group
- Bind domains to the group
- Query domain groups
- Query domains in a group

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars` and update the values:

```bash
cp terraform.tfvars.example terraform.tfvars
```

2. Set your Byteshield credentials as environment variables:

```bash
export BYTESHIELD_ACCESS_KEY="your-access-key"
export BYTESHIELD_SECRET_KEY="your-secret-key"
export BYTESHIELD_API_HOST="https://apiv4.lalcsafe.com"
```

3. Initialize Terraform:

```bash
terraform init
```

4. Plan and apply:

```bash
terraform plan
terraform apply
```

## Resources

- `byteshield_scdn_domain_group` - Manages a domain group

## Data Sources

- `byteshield_scdn_domain_groups` - Query domain groups
- `byteshield_scdn_domain_group_domains` - Query domains in a group

## Outputs

- `group_id` - The ID of the created domain group
- `group_query_result` - List of queried domain groups
- `group_domains` - List of domains in the group
