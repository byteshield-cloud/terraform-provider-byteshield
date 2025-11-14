package domain

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all domain-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_domain":               ResourceByteShieldScdnDomain(),
		"byteshield_scdn_origin":               ResourceByteShieldScdnOrigin(),
		"byteshield_scdn_cert_binding":         ResourceByteShieldScdnCertBinding(),
		"byteshield_scdn_domain_base_settings": ResourceByteShieldScdnDomainBaseSettings(),
		"byteshield_scdn_domain_status":        ResourceByteShieldScdnDomainStatus(),
		"byteshield_scdn_domain_node_switch":   ResourceByteShieldScdnDomainNodeSwitch(),
		"byteshield_scdn_domain_access_mode":   ResourceByteShieldScdnDomainAccessMode(),
	}
}

// DataSources returns all domain-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_domain":               DataSourceByteShieldScdnDomain(),
		"byteshield_scdn_domains":              DataSourceByteShieldScdnDomains(),
		"byteshield_scdn_origin":               DataSourceByteShieldScdnOrigin(),
		"byteshield_scdn_origins":              DataSourceByteShieldScdnOrigins(),
		"byteshield_scdn_domain_base_settings": DataSourceByteShieldScdnDomainBaseSettings(),
		"byteshield_scdn_access_progress":      DataSourceByteShieldScdnAccessProgress(),
		"byteshield_scdn_domain_templates":     DataSourceByteShieldScdnDomainTemplates(),
		"byteshield_scdn_brief_domains":        DataSourceByteShieldScdnBriefDomains(),
	}
}
