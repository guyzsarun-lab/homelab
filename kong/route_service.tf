data "local_file" "service_route" {
  filename = "${path.module}/route/service.json"
}

locals {
  service_route = jsondecode(data.local_file.service_route.content)
}

resource "kong-gateway_service" "dynamic-service-gateway" {
  for_each = { for service in local.service_route : service.name => service }
  enabled  = true

  name     = "${each.value.name}-gateway-service"
  host     = each.value.dest.host
  port     = each.value.dest.port
  protocol = each.value.dest.protocol
}

resource "kong-gateway_route" "dynamic-service-route" {
  for_each = { for service in local.service_route : service.name => service }

  name          = "${each.value.name}-route"
  protocols     = ["http", "https"]
  hosts         = [each.value.host]
  paths         = []
  preserve_host = true
  service = {
    id = kong-gateway_service.dynamic-service-gateway[each.value.name].id
  }
}