terraform {
 required_providers {
    cloudflare = {
    source = "cloudflare/cloudflare"
    version = "~> 2.0"
    }
 }
}

data "cloudflare_zones" "domain" {
 filter {
 name = var.site_domain
 }
}

resource "cloudflare_record" "record" {
 zone_id = data.cloudflare_zones.domain.zones[0].id
 name = var.record_name
 value = var.ip
 type = "A"
 ttl = 1
}
