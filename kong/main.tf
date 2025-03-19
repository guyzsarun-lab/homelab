output "route_k8s" {
  value = [
    for route in kong-gateway_route.dynamic-app-route : {
      id   = route.id
      name = route.name
      hosts = route.hosts[0]
    }
  ]
}

output "route_service" {
  value = [
    for service in kong-gateway_route.dynamic-service-route : {
      id = service.id
      name = service.name
      host = service.hosts[0]
    }
  ]
}