package main

import (
	byteshield "github.com/byteshield-cloud/terraform-provider-byteshield/src"

	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
)

// Version information, set by GoReleaser during build
var (
	version = "dev"
	commit  = "none"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: byteshield.Provider,
	})
}
