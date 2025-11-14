package cache_operate

import (
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/scdn/cache_operate/data"
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/scdn/cache_operate/resource"

	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all cache operate-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_cache_clean_task":   resource.ResourceByteShieldScdnCacheCleanTask(),
		"byteshield_scdn_cache_preheat_task": resource.ResourceByteShieldScdnCachePreheatTask(),
	}
}

// DataSources returns all cache operate-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_cache_clean_config":      data.DataSourceByteShieldScdnCacheCleanConfig(),
		"byteshield_scdn_cache_clean_tasks":       data.DataSourceByteShieldScdnCacheCleanTasks(),
		"byteshield_scdn_cache_clean_task_detail": data.DataSourceByteShieldScdnCacheCleanTaskDetail(),
		"byteshield_scdn_cache_preheat_tasks":     data.DataSourceByteShieldScdnCachePreheatTasks(),
	}
}
