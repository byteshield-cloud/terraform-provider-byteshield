package log_download

import (
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/scdn/log_download/data"
	"github.com/byteshield-cloud/terraform-provider-byteshield/src/services/scdn/log_download/resource"

	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all log download-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_log_download_task":            resource.ResourceByteShieldScdnLogDownloadTask(),
		"byteshield_scdn_log_download_template":        resource.ResourceByteShieldScdnLogDownloadTemplate(),
		"byteshield_scdn_log_download_template_status": resource.ResourceByteShieldScdnLogDownloadTemplateStatus(),
	}
}

// DataSources returns all log download-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_log_download_tasks":     data.DataSourceByteShieldScdnLogDownloadTasks(),
		"byteshield_scdn_log_download_templates": data.DataSourceByteShieldScdnLogDownloadTemplates(),
		"byteshield_scdn_log_download_fields":    data.DataSourceByteShieldScdnLogDownloadFields(),
	}
}
