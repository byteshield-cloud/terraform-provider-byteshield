package domain

import (
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/sdns/domain/data"
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/sdns/domain/resource"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all domain-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_sdns_domain": resource.ResourceByteshieldDnsDomain(),
	}
}

// DataSources returns all domain-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_sdns_domains": data.DataSourceByteshieldDnsDomain(),
	}
}
