resource "kong-gateway_consumer" "admin" {
  username = "admin"
}

resource "kong-gateway_basic_auth" "admin-auth" {

  consumer = {
    id = kong-gateway_consumer.admin.id
  }

  password = var.kong_manager_credentials.password
  username = var.kong_manager_credentials.username

  lifecycle {
    ignore_changes = [
      password
    ]
  }
}


resource "kong-gateway_plugin_basic_auth" "kong-manager-auth" {
  instance_name = "kong-manager-auth"
  enabled       = true
  config = {
    "hide_credentials" = true
  }
  service = {
    id = kong-gateway_service.dynamic-service-gateway["kong-manager"].id
  }
  protocols = [
    "http",
    "https"
  ]
}