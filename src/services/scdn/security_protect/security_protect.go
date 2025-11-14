package security_protect

import (
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/scdn/security_protect/data"
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/scdn/security_protect/resource"

	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Note: Import paths need to be adjusted based on actual package structure

// Resources returns all security protection-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_security_protection_ddos_config":           resource.ResourceByteShieldScdnSecurityProtectionDdosConfig(),
		"byteshield_scdn_security_protection_waf_config":            resource.ResourceByteShieldScdnSecurityProtectionWafConfig(),
		"byteshield_scdn_security_protection_template":              resource.ResourceByteShieldScdnSecurityProtectionTemplate(),
		"byteshield_scdn_security_protection_template_domain_bind":  resource.ResourceByteShieldScdnSecurityProtectionTemplateDomainBind(),
		"byteshield_scdn_security_protection_template_batch_config": resource.ResourceByteShieldScdnSecurityProtectionTemplateBatchConfig(),
	}
}

// DataSources returns all security protection-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_security_protection_ddos_config":              data.DataSourceByteShieldScdnSecurityProtectionDdosConfig(),
		"byteshield_scdn_security_protection_waf_config":               data.DataSourceByteShieldScdnSecurityProtectionWafConfig(),
		"byteshield_scdn_security_protection_template":                 data.DataSourceByteShieldScdnSecurityProtectionTemplate(),
		"byteshield_scdn_security_protection_templates":                data.DataSourceByteShieldScdnSecurityProtectionTemplates(),
		"byteshield_scdn_security_protection_template_domains":         data.DataSourceByteShieldScdnSecurityProtectionTemplateDomains(),
		"byteshield_scdn_security_protection_template_unbound_domains": data.DataSourceByteShieldScdnSecurityProtectionTemplateUnboundDomains(),
		"byteshield_scdn_security_protection_member_global_template":   data.DataSourceByteShieldScdnSecurityProtectionMemberGlobalTemplate(),
		"byteshield_scdn_security_protection_iota":                     data.DataSourceByteShieldScdnSecurityProtectionIota(),
	}
}
