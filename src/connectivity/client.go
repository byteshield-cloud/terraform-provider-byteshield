package connectivity

import (
	"sync"
	"time"
)

// Config contains all the configuration for ByteShield provider
type Config struct {
	AccessKey string
	SecretKey string
	Endpoint  string
	Region    string
}

// ByteShieldClient is the main client struct that holds all service clients
type ByteShieldClient struct {
	config     *Config
	scdnClient *ScdnClient // For SCDN

	// Use sync.Once to ensure clients are initialized only once
	scdnClientOnce sync.Once

	// Store initialization errors
	scdnClientErr error
}

// Client returns the ByteShield client
func (c *Config) Client() (*ByteShieldClient, error) {
	client := &ByteShieldClient{
		config: c,
	}

	return client, nil
}

// ScdnClient returns or initializes the SCDN API client
func (c *ByteShieldClient) ScdnClient() (*ScdnClient, error) {
	c.scdnClientOnce.Do(func() {
		// Use the same endpoint as API client but with SCDN-specific path
		scdnEndpoint := c.config.Endpoint
		if scdnEndpoint == "" {
			scdnEndpoint = "https://apiv4.lalcsafe.com"
		}

		c.scdnClient = NewScdnClient(scdnEndpoint, c.config.AccessKey, c.config.SecretKey, 30*time.Second)
	})

	return c.scdnClient, c.scdnClientErr
}
