package domain_group

import (
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/sdns/domain_group/data"
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/sdns/domain_group/resource"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all domain group-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_sdns_domain_group": resource.ResourceByteshieldDnsGroup(),
	}
}

// DataSources returns all domain group-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_sdns_domain_groups": data.DataSourceByteshieldDnsGroup(),
	}
}
