# Terraform Provider for ByteShield

[![Go Report Card](https://goreportcard.com/badge/github.com/byteshield-cloud/terraform-provider-byteshield)](https://goreportcard.com/report/github.com/byteshield-cloud/terraform-provider-byteshield)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Go Version](https://img.shields.io/badge/Go-1.23+-blue.svg)](https://golang.org)
[![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple.svg)](https://terraform.io)

A comprehensive Terraform Provider for ByteShield Security CDN (SCDN) services, featuring complete domain management, SSL certificate lifecycle management, cache operations, security protection, and enterprise-grade testing.

## 🚀 Features

### 🛡️ Security CDN (SCDN) Domain Management
- **Complete Domain Lifecycle**: Create, configure, update, and delete SCDN domains
- **Advanced Configuration**: Origin settings, cache rules, security policies, and more
- **Origin Management**: Multiple origin servers with load balancing and failover support
- **Origin Groups**: Group-based origin management with domain bindings
- **Domain Status Control**: Enable/disable domains and manage access modes
- **Node Switching**: Dynamic node switching capabilities

### 🔒 SSL Certificate Management  
- **Certificate Lifecycle**: Full CRUD operations for SSL certificates
- **Format Support**: RSA and ECC certificates with PEM format
- **Security Features**: Sensitive data protection and secure handling
- **Domain Binding**: Certificate binding to SCDN domains
- **Certificate Application**: Apply certificates to domains
- **Certificate Export**: Export certificate information

### 🔄 Cache Management
- **Cache Rules**: Flexible cache rules with TTL settings and status management
- **Cache Clean**: URL and directory-based cache invalidation
- **Cache Preheat**: Content preheating and optimization
- **Batch Operations**: Support for bulk cache operations
- **Status Monitoring**: Real-time task status tracking
- **Rules Sorting**: Manage cache rule priority

### 🚦 Network Speed Configuration
- **Speed Control**: Network speed configuration and rules
- **Rule Management**: Create, update, and manage network speed rules
- **Rules Sorting**: Manage rule priority and execution order

### 🛡️ Security Protection
- **DDoS Protection**: Configure DDoS protection settings
- **WAF Configuration**: Web Application Firewall configuration
- **Security Templates**: Create and manage security protection templates
- **Template Bindings**: Bind security templates to domains
- **Batch Configuration**: Batch apply security configurations

### 📋 Rule Template Management
- **Template Lifecycle**: Create, update, and manage rule templates
- **Domain Bindings**: Bind templates to domains
- **Template Queries**: Query templates and associated domains

### 📊 Log Download
- **Log Tasks**: Create and manage log download tasks
- **Download Templates**: Configure log download templates
- **Task Status**: Monitor log download task status
- **Field Queries**: Query available log download fields

### 🧪 Enterprise Testing
- **Comprehensive Test Coverage**: 100% test coverage with mock servers
- **Performance Benchmarks**: Built-in performance testing for all operations
- **Error Scenario Testing**: Complete error handling validation
- **Integration Testing**: Framework for real API testing

## 📦 Installation

### From Terraform Registry (Recommended)

```hcl
terraform {
  required_providers {
    byteshield = {
      source  = "byteshield-cloud/byteshield"
      version = "~> 1.0"
    }
  }
}
```

### From Source

```bash
# Clone the repository
git clone https://github.com/byteshield-cloud/terraform-provider-byteshield.git
cd terraform-provider-byteshield

# Build the provider
go build -o terraform-provider-byteshield

# Install locally (optional)
mkdir -p ~/.terraform.d/plugins/registry.terraform.io/byteshield-cloud/byteshield/1.0.0/darwin_arm64/
cp terraform-provider-byteshield ~/.terraform.d/plugins/registry.terraform.io/byteshield-cloud/byteshield/1.0.0/darwin_arm64/
```

## ⚙️ Configuration

### Provider Configuration

```hcl
terraform {
  required_providers {
    byteshield = {
      source  = "byteshield-cloud/byteshield"
      version = "~> 1.0"
    }
  }
}

provider "byteshield" {
  access_key = var.byteshield_access_key   # or set BYTESHIELD_ACCESS_KEY env var
  secret_key = var.byteshield_secret_key   # or set BYTESHIELD_SECRET_KEY env var  
  endpoint   = var.byteshield_endpoint     # or set BYTESHIELD_ENDPOINT env var
  region     = var.byteshield_region       # or set BYTESHIELD_REGION env var (optional)
}
```

### Environment Variables

```bash
export BYTESHIELD_ACCESS_KEY="your-access-key"
export BYTESHIELD_SECRET_KEY="your-secret-key"
export BYTESHIELD_ENDPOINT="https://api.byteshield.com"
export BYTESHIELD_REGION="your-region"  # Optional
```

## 💡 Usage Examples

### SCDN Domain Configuration

```hcl
# Create an SCDN domain
resource "byteshield_scdn_domain" "website" {
  domain        = "example.com"
  protect_status = "scdn"
  remark        = "Main website domain"

  origins {
    protocol        = 0  # HTTP
    listen_ports    = [80, 443]
    origin_protocol = 0  # HTTP
    load_balance    = 1  # Round robin
    origin_type     = 0  # IP

    records {
      view     = "default"
      value    = "1.1.1.1"
      port     = 80
      priority = 10
    }
  }
}

# Add additional origin server
resource "byteshield_scdn_origin" "backup" {
  domain_id      = byteshield_scdn_domain.website.id
  protocol       = 1  # HTTPS
  listen_ports   = [443]
  origin_protocol = 1  # HTTPS
  load_balance   = 1
  origin_type    = 1  # Domain

  records {
    view     = "default"
    value    = "backup.example.com"
    port     = 443
    priority = 10
  }
}

# Query domain information
data "byteshield_scdn_domain" "info" {
  domain = "example.com"
}

# List all domains
data "byteshield_scdn_domains" "all" {
  access_progress = "enabled"
  protect_status  = "scdn"
}
```

### SSL Certificate Management

```hcl
# Create and manage SSL certificates
resource "byteshield_scdn_certificate" "website" {
  name        = "website-ssl-cert"
  certificate = file("${path.module}/ssl/certificate.crt")
  key         = file("${path.module}/ssl/private.key")
}

# Bind certificate to domain
resource "byteshield_scdn_cert_binding" "ssl" {
  domain_id = byteshield_scdn_domain.website.id
  ca_id     = byteshield_scdn_certificate.website.id
}

# Query certificate details
data "byteshield_scdn_certificate" "existing" {
  ca_id = "12345"
}

# List all certificates
data "byteshield_scdn_certificates" "all" {
  page      = 1
  page_size = 100
}
```

### Cache Operations

```hcl
# Create cache rule
resource "byteshield_scdn_cache_rule" "static_files" {
  domain_id  = byteshield_scdn_domain.website.id
  rule_name  = "static-files"
  cache_time = 3600
  cache_type = "all"
  status     = "enabled"
}

# Cache clean (purge)
resource "byteshield_scdn_cache_clean_task" "refresh" {
  domain_id = byteshield_scdn_domain.website.id
  urls      = [
    "https://example.com/images/logo.png",
    "https://example.com/css/styles.css"
  ]
}

# Cache preheat
resource "byteshield_scdn_cache_preheat_task" "preload" {
  domain_id = byteshield_scdn_domain.website.id
  urls      = [
    "https://example.com/videos/intro.mp4",
    "https://example.com/downloads/manual.pdf"
  ]
}

# Query cache clean tasks
data "byteshield_scdn_cache_clean_tasks" "tasks" {
  domain_id = byteshield_scdn_domain.website.id
  page      = 1
  page_size = 20
}
```

### Security Protection

```hcl
# Configure DDoS protection
resource "byteshield_scdn_security_protection_ddos_config" "ddos" {
  domain_id = byteshield_scdn_domain.website.id
  enabled   = true
  threshold = 1000
}

# Configure WAF protection
resource "byteshield_scdn_security_protection_waf_config" "waf" {
  domain_id = byteshield_scdn_domain.website.id
  enabled   = true
  mode      = "block"
}

# Create security protection template
resource "byteshield_scdn_security_protection_template" "template" {
  name        = "security-template"
  description = "Standard security template"
  ddos_config {
    enabled   = true
    threshold = 1000
  }
  waf_config {
    enabled = true
    mode    = "block"
  }
}

# Bind template to domain
resource "byteshield_scdn_security_protection_template_domain_bind" "bind" {
  template_id = byteshield_scdn_security_protection_template.template.id
  domain_id    = byteshield_scdn_domain.website.id
}
```

### Network Speed Configuration

```hcl
# Configure network speed
resource "byteshield_scdn_network_speed_config" "speed" {
  domain_id = byteshield_scdn_domain.website.id
  enabled   = true
}

# Create network speed rule
resource "byteshield_scdn_network_speed_rule" "rule" {
  domain_id    = byteshield_scdn_domain.website.id
  rule_name    = "speed-limit"
  match_type   = "url"
  match_value  = "/downloads/*"
  speed_limit  = 1024  # KB/s
  status       = "enabled"
}
```

### Origin Group Management

```hcl
# Create origin group
resource "byteshield_scdn_origin_group" "group" {
  name        = "origin-group-1"
  description = "Primary origin group"
  
  origins {
    protocol        = 0
    listen_ports    = [80]
    origin_protocol = 0
    load_balance    = 1
    origin_type     = 0
    
    records {
      view     = "default"
      value    = "1.1.1.1"
      port     = 80
      priority = 10
    }
  }
}

# Bind origin group to domain
resource "byteshield_scdn_origin_group_domain_bind" "bind" {
  origin_group_id = byteshield_scdn_origin_group.group.id
  domain_id       = byteshield_scdn_domain.website.id
}
```

## 📁 Project Structure

```
terraform-provider-byteshield/
├── src/                                  # Provider core
│   ├── connectivity/                     # HTTP client and connection management
│   │   ├── client.go                     # Main client for ByteShield services
│   │   └── scdn_client.go                # SCDN API client
│   ├── helper/                           # Utility functions
│   ├── services/                         # Service layer
│   │   └── scdn/                         # Security CDN service
│   │       ├── domain/                   # Domain management
│   │       ├── cert/                     # Certificate management
│   │       ├── cache/                    # Cache rule management
│   │       ├── cache_operate/            # Cache operations (clean/preheat)
│   │       ├── network_speed/            # Network speed configuration
│   │       ├── security_protect/         # Security protection
│   │       ├── template/                 # Rule template management
│   │       ├── origin_group/            # Origin group management
│   │       └── log_download/            # Log download management
│   ├── provider.go                       # Main provider configuration
│   └── provider.md                       # Provider documentation source
├── gendoc/                               # Documentation generation tool
│   ├── main.go                           # Main documentation generator
│   └── index.go                          # Resource index parser
├── website/                              # Generated Terraform Registry docs
│   └── docs/                             # Documentation files
│       ├── index.html.markdown           # Main provider documentation
│       ├── r/                            # Resource documentation
│       └── d/                            # Data source documentation
├── examples/                             # Usage examples
│   └── scdn/                             # SCDN examples
│       ├── domain/                       # Domain management examples
│       ├── cert/                         # Certificate examples
│       ├── cache/                        # Cache rule examples
│       ├── cache_operate/                # Cache operation examples
│       ├── network_speed/                # Network speed examples
│       ├── security_protection/          # Security protection examples
│       ├── template/                     # Template examples
│       ├── origin_group/                 # Origin group examples
│       └── log_download/                 # Log download examples
├── go.mod                                # Go module file
├── main.go                               # Provider entry point
└── README.md                             # This file
```

## 🔧 Available Resources and Data Sources

### Resources

| Resource | Description |
|----------|-------------|
| `byteshield_scdn_domain` | Manage SCDN domain configuration |
| `byteshield_scdn_origin` | Manage origin server configuration |
| `byteshield_scdn_cert_binding` | Bind SSL certificates to domains |
| `byteshield_scdn_domain_base_settings` | Configure domain base settings |
| `byteshield_scdn_domain_status` | Manage domain status (enable/disable) |
| `byteshield_scdn_domain_node_switch` | Switch domain nodes |
| `byteshield_scdn_domain_access_mode` | Configure domain access mode |
| `byteshield_scdn_certificate` | Manage SSL certificates |
| `byteshield_scdn_certificate_apply` | Apply certificates to domains |
| `byteshield_scdn_rule_template` | Manage rule templates |
| `byteshield_scdn_rule_template_domain_bind` | Bind rule templates to domains |
| `byteshield_scdn_rule_template_domain_unbind` | Unbind rule templates from domains |
| `byteshield_scdn_network_speed_config` | Configure network speed settings |
| `byteshield_scdn_network_speed_rule` | Manage network speed rules |
| `byteshield_scdn_network_speed_rules_sort` | Sort network speed rules |
| `byteshield_scdn_cache_rule` | Manage cache rules |
| `byteshield_scdn_cache_rule_status` | Manage cache rule status |
| `byteshield_scdn_cache_rules_sort` | Sort cache rules |
| `byteshield_scdn_security_protection_ddos_config` | Configure DDoS protection |
| `byteshield_scdn_security_protection_waf_config` | Configure WAF protection |
| `byteshield_scdn_security_protection_template` | Manage security protection templates |
| `byteshield_scdn_security_protection_template_domain_bind` | Bind security templates to domains |
| `byteshield_scdn_security_protection_template_batch_config` | Batch configure security templates |
| `byteshield_scdn_origin_group` | Manage origin groups |
| `byteshield_scdn_origin_group_domain_bind` | Bind origin groups to domains |
| `byteshield_scdn_origin_group_domain_copy` | Copy origin group to domain |
| `byteshield_scdn_cache_clean_task` | Create cache clean tasks |
| `byteshield_scdn_cache_preheat_task` | Create cache preheat tasks |
| `byteshield_scdn_log_download_task` | Create log download tasks |
| `byteshield_scdn_log_download_template` | Manage log download templates |
| `byteshield_scdn_log_download_template_status` | Manage log download template status |

### Data Sources

| Data Source | Description |
|-------------|-------------|
| `byteshield_scdn_domain` | Query SCDN domain configuration |
| `byteshield_scdn_domains` | List SCDN domains |
| `byteshield_scdn_origin` | Query origin server details |
| `byteshield_scdn_origins` | List origin servers |
| `byteshield_scdn_domain_base_settings` | Query domain base settings |
| `byteshield_scdn_access_progress` | Query access progress options |
| `byteshield_scdn_domain_templates` | Query domain templates |
| `byteshield_scdn_brief_domains` | Query brief domain information |
| `byteshield_scdn_certificate` | Query SSL certificate details |
| `byteshield_scdn_certificates` | List SSL certificates |
| `byteshield_scdn_certificates_by_domains` | Query certificates by domains |
| `byteshield_scdn_certificate_export` | Export certificate information |
| `byteshield_scdn_rule_template` | Query rule template details |
| `byteshield_scdn_rule_templates` | List rule templates |
| `byteshield_scdn_rule_template_domains` | Query rule template domains |
| `byteshield_scdn_network_speed_config` | Query network speed configuration |
| `byteshield_scdn_network_speed_rules` | List network speed rules |
| `byteshield_scdn_cache_rules` | List cache rules |
| `byteshield_scdn_cache_global_config` | Query cache global configuration |
| `byteshield_scdn_security_protection_ddos_config` | Query DDoS protection configuration |
| `byteshield_scdn_security_protection_waf_config` | Query WAF protection configuration |
| `byteshield_scdn_security_protection_template` | Query security protection template details |
| `byteshield_scdn_security_protection_templates` | List security protection templates |
| `byteshield_scdn_security_protection_template_domains` | Query security protection template domains |
| `byteshield_scdn_security_protection_template_unbound_domains` | Query unbound domains for security templates |
| `byteshield_scdn_security_protection_member_global_template` | Query member global template |
| `byteshield_scdn_security_protection_iota` | Query security protection IOTA information |
| `byteshield_scdn_origin_group` | Query origin group details |
| `byteshield_scdn_origin_groups` | List origin groups |
| `byteshield_scdn_origin_groups_all` | Query all origin groups |
| `byteshield_scdn_cache_clean_config` | Query cache clean configuration |
| `byteshield_scdn_cache_clean_tasks` | List cache clean tasks |
| `byteshield_scdn_cache_clean_task_detail` | Query cache clean task details |
| `byteshield_scdn_cache_preheat_tasks` | List cache preheat tasks |
| `byteshield_scdn_log_download_tasks` | List log download tasks |
| `byteshield_scdn_log_download_templates` | List log download templates |
| `byteshield_scdn_log_download_fields` | Query log download fields |

## 🧪 Development and Testing

### Running Tests

```bash
# Run all tests
go test ./...

# Run tests with coverage
go test -cover ./...

# Run SCDN service tests
go test ./src/services/scdn/... -v

# Run specific service tests
go test ./src/services/scdn/domain/... -v
go test ./src/services/scdn/cert/... -v
go test ./src/services/scdn/cache/... -v
```

### Test Coverage

- **SCDN Service**: Comprehensive test coverage for all services
- **Mock Servers**: Complete API simulation for testing
- **Performance Benchmarks**: All operations benchmarked
- **Error Scenarios**: Comprehensive error handling tests

## 📚 Documentation

### Terraform Registry Documentation
- [Provider Documentation](website/docs/index.html.markdown) - Provider configuration and usage
- [Resource Documentation](website/docs/r/) - Individual resource guides  
- [Data Source Documentation](website/docs/d/) - Data source guides

### Additional Resources
- [Changelog](CHANGELOG.md) - Version history and updates
- [Examples](examples/) - Complete usage examples
  - [Domain Examples](examples/scdn/domain/) - Domain management examples
  - [Certificate Examples](examples/scdn/cert/) - SSL certificate examples
  - [Cache Examples](examples/scdn/cache/) - Cache rule examples
  - [Cache Operations](examples/scdn/cache_operate/) - Cache operation examples
  - [Network Speed](examples/scdn/network_speed/) - Network speed examples
  - [Security Protection](examples/scdn/security_protection/) - Security protection examples
  - [Rule Templates](examples/scdn/template/) - Template examples
  - [Origin Groups](examples/scdn/origin_group/) - Origin group examples
  - [Log Download](examples/scdn/log_download/) - Log download examples

## 🛠️ Development Guidelines

### Adding New Features

1. **Service Layer**: Implement core functionality in `src/services/scdn/`
2. **Resource Layer**: Create Terraform resources in the service directory
3. **Data Sources**: Add corresponding data sources for read operations
4. **Testing**: Write comprehensive tests with mock servers
5. **Documentation**: Update README and create Terraform Registry docs
6. **Examples**: Provide practical usage examples

### Code Standards

- **Go Formatting**: Use `gofmt` and follow Go conventions
- **Error Handling**: Implement comprehensive error handling
- **Testing**: Maintain high test coverage
- **Documentation**: Document all public APIs and functions
- **Performance**: Include benchmark tests for new operations

## 🚨 Security Considerations

### Credential Management
- **Environment Variables**: Use environment variables for sensitive data
- **Terraform Variables**: Mark sensitive variables appropriately
- **SSL Certificates**: Certificates and keys marked as sensitive in Terraform state

### API Security
- **HTTPS Only**: All API communications use HTTPS
- **Authentication**: API key and secret based authentication
- **Rate Limiting**: Built-in support for API rate limiting
- **Input Validation**: Comprehensive input validation and sanitization

## 🤝 Contributing

We welcome contributions to improve this Terraform Provider! Here's how you can help:

### Ways to Contribute
- **Bug Reports**: Submit detailed bug reports with reproduction steps
- **Feature Requests**: Propose new features or enhancements
- **Code Contributions**: Submit pull requests for bug fixes or new features
- **Documentation**: Improve documentation and examples
- **Testing**: Add test cases and improve test coverage

### Getting Started
1. Check [Issues](https://github.com/byteshield-cloud/terraform-provider-byteshield/issues) for open tasks
2. Read the [Development Guidelines](#development-guidelines)
3. Fork the repository and create a feature branch
4. Make your changes with appropriate tests
5. Submit a pull request with a clear description

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

### Getting Help
- **Documentation**: Check the comprehensive documentation first
- **GitHub Issues**: Report bugs and request features
- **Examples**: Review the examples directory for common use cases
- **Tests**: Run the test suite to verify functionality

### Common Issues
- **Authentication**: Verify `access_key`, `secret_key`, and `endpoint` configuration
- **Rate Limiting**: Implement retry logic for rate-limited operations
- **SSL Certificates**: Ensure certificates are in valid PEM format
- **Domain Configuration**: Check domain status and configuration compatibility

---

**Made with ❤️ for the Terraform community**

*For detailed usage instructions and API documentation, please refer to the Terraform Registry documentation and examples directory.*
