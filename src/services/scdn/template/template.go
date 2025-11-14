package template

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all rule template-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_rule_template":               ResourceByteShieldScdnRuleTemplate(),
		"byteshield_scdn_rule_template_domain_bind":   ResourceByteShieldScdnRuleTemplateDomainBind(),
		"byteshield_scdn_rule_template_domain_unbind": ResourceByteShieldScdnRuleTemplateDomainUnbind(),
	}
}

// DataSources returns all rule template-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_rule_template":         DataSourceByteShieldScdnRuleTemplate(),
		"byteshield_scdn_rule_templates":        DataSourceByteShieldScdnRuleTemplates(),
		"byteshield_scdn_rule_template_domains": DataSourceByteShieldScdnRuleTemplateDomains(),
	}
}
