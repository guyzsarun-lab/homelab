terraform {
  required_providers {
    kong-gateway = {
      source  = "Kong/kong-gateway"
      version = "0.3.0"
    }
  }
  required_version = "~> 1.11.0"
}

provider "kong-gateway" {
  # Configuration options
  server_url = var.kong_admin_url
}