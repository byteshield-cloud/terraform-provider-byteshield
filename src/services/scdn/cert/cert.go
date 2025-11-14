package cert

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Resources returns all certificate-related resources
func Resources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_certificate":       ResourceByteShieldScdnCertificate(),
		"byteshield_scdn_certificate_apply": ResourceByteShieldScdnCertificateApply(),
	}
}

// DataSources returns all certificate-related data sources
func DataSources() map[string]*schema.Resource {
	return map[string]*schema.Resource{
		"byteshield_scdn_certificate":             DataSourceByteShieldScdnCertificate(),
		"byteshield_scdn_certificates":            DataSourceByteShieldScdnCertificates(),
		"byteshield_scdn_certificates_by_domains": DataSourceByteShieldScdnCertificatesByDomains(),
		"byteshield_scdn_certificate_export":      DataSourceByteShieldScdnCertificateExport(),
	}
}
