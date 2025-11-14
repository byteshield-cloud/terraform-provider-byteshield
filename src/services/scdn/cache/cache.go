package cache

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all cache-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_cache_rule":        ResourceByteShieldScdnCacheRule(),
		"byteshield_scdn_cache_rule_status": ResourceByteShieldScdnCacheRuleStatus(),
		"byteshield_scdn_cache_rules_sort":  ResourceByteShieldScdnCacheRulesSort(),
	}
}

// DataSources returns all cache-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_cache_rules":         DataSourceByteShieldScdnCacheRules(),
		"byteshield_scdn_cache_global_config": DataSourceByteShieldScdnCacheGlobalConfig(),
	}
}
