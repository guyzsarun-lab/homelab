data "local_file" "app_route" {
  filename = "${path.module}/route/k8s.json"
}

locals {
  app_route = jsondecode(data.local_file.app_route.content)
}

resource "kong-gateway_service" "kubernetes-cluster" {
  enabled  = true
  host     = "k8s.proxmox.homelab"
  name     = "k8s-gateway-service"
  port     = "443"
  protocol = "https"
}

resource "kong-gateway_route" "dynamic-app-route" {
  for_each = { for route in local.app_route : route.name => route }

  name          = each.value.name
  protocols     = ["http", "https"]
  hosts         = each.value.hosts
  paths         = each.value.paths
  preserve_host = true
  strip_path    = each.value.strip_path
  service = {
    id = kong-gateway_service.kubernetes-cluster.id
  }
}