package networkspeed

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all network speed-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_network_speed_config":     ResourceByteShieldScdnNetworkSpeedConfig(),
		"byteshield_scdn_network_speed_rule":       ResourceByteShieldScdnNetworkSpeedRule(),
		"byteshield_scdn_network_speed_rules_sort": ResourceByteShieldScdnNetworkSpeedRulesSort(),
	}
}

// DataSources returns all network speed-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_network_speed_config": DataSourceByteShieldScdnNetworkSpeedConfig(),
		"byteshield_scdn_network_speed_rules":  DataSourceByteShieldScdnNetworkSpeedRules(),
	}
}
