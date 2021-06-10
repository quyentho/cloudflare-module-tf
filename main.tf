terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
  }
}
provider "cloudflare" {
 email = "thokimquangquyen@gmail.com"
 api_token = var.cloudflare_api_token
}

module "cloudflare_client" {
  source = "./cloudflare"
  ip = var.webapi_ip
  record_name = "quyenclient"
}
module "cloudflare_webapi" {
  source = "./cloudflare"
  ip = var.client_ip
  record_name = var.environment == "production" ? "quyenprod" : "quyenstag"
}