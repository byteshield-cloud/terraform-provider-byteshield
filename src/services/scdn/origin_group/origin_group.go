package origin_group

import (
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/scdn/origin_group/data"
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/scdn/origin_group/resource"

	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all origin group-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_origin_group":             resource.ResourceByteShieldScdnOriginGroup(),
		"byteshield_scdn_origin_group_domain_bind": resource.ResourceByteShieldScdnOriginGroupDomainBind(),
		"byteshield_scdn_origin_group_domain_copy": resource.ResourceByteShieldScdnOriginGroupDomainCopy(),
	}
}

// DataSources returns all origin group-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_origin_group":      data.DataSourceByteShieldScdnOriginGroup(),
		"byteshield_scdn_origin_groups":     data.DataSourceByteShieldScdnOriginGroups(),
		"byteshield_scdn_origin_groups_all": data.DataSourceByteShieldScdnOriginGroupsAll(),
		// "byteshield_scdn_origin_group_bind_history": data.DataSourceByteShieldScdnOriginGroupBindHistory(), // Temporarily disabled due to API ambiguity
	}
}
