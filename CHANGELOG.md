# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2025-09-11

### Added
- **SCDN Domain Management**: Complete lifecycle management for Security CDN domains
  - Create, read, update, delete SCDN domains
  - Support for multiple origin server configurations
  - Support for origin groups with load balancing
  - Domain status and access mode management
  - Node switching capabilities
  
- **Comprehensive SCDN Configuration**: Full configuration management
  - Domain base settings configuration
  - Origin server configuration with failover support
  - Certificate binding and management
  - Rule template management with domain bindings
  - Network speed configuration and rules
  - Cache rules with flexible TTL settings
  - Security protection (DDoS, WAF) configuration
  - And many more...

- **Smart Incremental Updates**: Intelligent configuration management
  - Only updates changed configuration items
  - Preserves existing configurations when not explicitly managed
  - Prevents unnecessary API calls and service disruptions

- **Cache Operations**: URL and directory cache operations
  - Cache purging (clean) with status tracking
  - URL preloading (preheat) with batch support
  - Support for file extensions and directory patterns

- **SSL Certificate Management**: Complete certificate lifecycle
  - Certificate creation and management
  - Certificate binding to domains
  - Certificate application and export
  - Certificate query by domains

- **Security Protection**: Advanced security features
  - DDoS protection configuration
  - WAF (Web Application Firewall) configuration
  - Security protection templates
  - Template domain bindings and batch configuration

- **Data Sources**: Query existing resources
  - Domain configuration queries
  - Origin server queries
  - Certificate information retrieval
  - Cache operation status queries
  - Security protection configuration queries
  - Network speed configuration queries
  - Rule template queries
  - Origin group queries
  - Log download task queries

- **Comprehensive Documentation**: Full resource documentation
  - Detailed parameter descriptions
  - Usage examples for all resources
  - Best practices and troubleshooting guides

### Technical Features
- **Type-Safe API Conversion**: Robust bidirectional data conversion between Terraform schema and API formats
- **Error Handling**: Comprehensive error handling with detailed messages
- **State Management**: Accurate state tracking with drift detection
- **Field Mapping**: Automatic handling of field name differences between Terraform and API
- **Default Value Management**: Smart handling of optional parameters and API defaults

### Resources
- `byteshield_scdn_domain`: Complete SCDN domain and configuration management
- `byteshield_scdn_origin`: Origin server management
- `byteshield_scdn_cert_binding`: SSL certificate binding to domains
- `byteshield_scdn_domain_base_settings`: Domain base settings configuration
- `byteshield_scdn_domain_status`: Domain status management
- `byteshield_scdn_domain_node_switch`: Domain node switching
- `byteshield_scdn_domain_access_mode`: Domain access mode configuration
- `byteshield_scdn_certificate`: SSL certificate management
- `byteshield_scdn_certificate_apply`: Certificate application
- `byteshield_scdn_rule_template`: Rule template management
- `byteshield_scdn_rule_template_domain_bind`: Rule template domain binding
- `byteshield_scdn_rule_template_domain_unbind`: Rule template domain unbinding
- `byteshield_scdn_network_speed_config`: Network speed configuration
- `byteshield_scdn_network_speed_rule`: Network speed rules
- `byteshield_scdn_network_speed_rules_sort`: Network speed rules sorting
- `byteshield_scdn_cache_rule`: Cache rules management
- `byteshield_scdn_cache_rule_status`: Cache rule status management
- `byteshield_scdn_cache_rules_sort`: Cache rules sorting
- `byteshield_scdn_security_protection_ddos_config`: DDoS protection configuration
- `byteshield_scdn_security_protection_waf_config`: WAF protection configuration
- `byteshield_scdn_security_protection_template`: Security protection template management
- `byteshield_scdn_security_protection_template_domain_bind`: Security protection template domain binding
- `byteshield_scdn_security_protection_template_batch_config`: Security protection template batch configuration
- `byteshield_scdn_origin_group`: Origin group management
- `byteshield_scdn_origin_group_domain_bind`: Origin group domain binding
- `byteshield_scdn_origin_group_domain_copy`: Origin group domain copying
- `byteshield_scdn_cache_clean_task`: Cache purging operations
- `byteshield_scdn_cache_preheat_task`: URL preloading operations
- `byteshield_scdn_log_download_task`: Log download task management
- `byteshield_scdn_log_download_template`: Log download template management
- `byteshield_scdn_log_download_template_status`: Log download template status management

### Data Sources
- `data.byteshield_scdn_domain`: Query domain configurations
- `data.byteshield_scdn_domains`: Query multiple domain configurations
- `data.byteshield_scdn_origin`: Query origin server details
- `data.byteshield_scdn_origins`: Query multiple origin servers
- `data.byteshield_scdn_domain_base_settings`: Query domain base settings
- `data.byteshield_scdn_access_progress`: Query access progress options
- `data.byteshield_scdn_domain_templates`: Query domain templates
- `data.byteshield_scdn_brief_domains`: Query brief domain information
- `data.byteshield_scdn_certificate`: Query certificate information
- `data.byteshield_scdn_certificates`: Query multiple certificates
- `data.byteshield_scdn_certificates_by_domains`: Query certificates by domains
- `data.byteshield_scdn_certificate_export`: Query certificate export information
- `data.byteshield_scdn_rule_template`: Query rule template details
- `data.byteshield_scdn_rule_templates`: Query multiple rule templates
- `data.byteshield_scdn_rule_template_domains`: Query rule template domains
- `data.byteshield_scdn_network_speed_config`: Query network speed configuration
- `data.byteshield_scdn_network_speed_rules`: Query network speed rules
- `data.byteshield_scdn_cache_rules`: Query cache rules
- `data.byteshield_scdn_cache_global_config`: Query cache global configuration
- `data.byteshield_scdn_security_protection_ddos_config`: Query DDoS protection configuration
- `data.byteshield_scdn_security_protection_waf_config`: Query WAF protection configuration
- `data.byteshield_scdn_security_protection_template`: Query security protection template details
- `data.byteshield_scdn_security_protection_templates`: Query multiple security protection templates
- `data.byteshield_scdn_security_protection_template_domains`: Query security protection template domains
- `data.byteshield_scdn_security_protection_template_unbound_domains`: Query unbound domains for security protection templates
- `data.byteshield_scdn_security_protection_member_global_template`: Query member global template
- `data.byteshield_scdn_security_protection_iota`: Query security protection IOTA information
- `data.byteshield_scdn_origin_group`: Query origin group details
- `data.byteshield_scdn_origin_groups`: Query multiple origin groups
- `data.byteshield_scdn_origin_groups_all`: Query all origin groups
- `data.byteshield_scdn_cache_clean_config`: Query cache clean configuration
- `data.byteshield_scdn_cache_clean_tasks`: Query cache clean tasks
- `data.byteshield_scdn_cache_clean_task_detail`: Query cache clean task details
- `data.byteshield_scdn_cache_preheat_tasks`: Query cache preheat tasks
- `data.byteshield_scdn_log_download_tasks`: Query log download tasks
- `data.byteshield_scdn_log_download_templates`: Query log download templates
- `data.byteshield_scdn_log_download_fields`: Query log download fields

[Unreleased]: https://github.com/byteshield-cloud/terraform-provider-byteshield/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/byteshield-cloud/terraform-provider-byteshield/releases/tag/v1.0.0
