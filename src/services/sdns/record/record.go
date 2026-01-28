package record

import (
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/sdns/record/data"
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/sdns/record/resource"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all record-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_dns_record": resource.ResourceByteshieldDnsRecord(),
	}
}

// DataSources returns all record-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_dns_record": data.DataSourceByteshieldDnsRecord(),
	}
}
