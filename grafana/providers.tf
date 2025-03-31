terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.22.0"
    }
  }
}

provider "grafana" {
  url  = var.grafana_url
  auth = var.grafana_credentials
}