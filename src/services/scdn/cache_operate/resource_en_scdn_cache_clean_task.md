Provides a resource to create SCDN cache clean tasks.

Example Usage

Clean whole site cache

```hcl
resource "byteshield_scdn_cache_clean_task" "example" {
  wholesite = ["example.com", "www.example.com"]
}
```

Clean special URLs

```hcl
resource "byteshield_scdn_cache_clean_task" "example" {
  specialurl = [
    "https://example.com/page1",
    "https://example.com/page2"
  ]
}
```

Clean special directories

```hcl
resource "byteshield_scdn_cache_clean_task" "example" {
  specialdir = [
    "/static/",
    "/images/"
  ]
}
```

Clean by group

```hcl
resource "byteshield_scdn_cache_clean_task" "example" {
  group_id = 1
  protocol = "https"
  port     = "443"
  wholesite = ["example.com"]
}
```

