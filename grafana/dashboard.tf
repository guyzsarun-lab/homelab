resource "grafana_dashboard" "networking" {
  folder      = grafana_folder.folder["Networking"].uid
  for_each    = fileset("${path.module}/dashboard/networking", "*.json")
  config_json = file("${path.module}/dashboard/networking/${each.value}")
}

resource "grafana_dashboard" "hardware" {
  folder      = grafana_folder.folder["Hardware"].uid
  for_each    = fileset("${path.module}/dashboard/hardware", "*.json")
  config_json = file("${path.module}/dashboard/hardware/${each.value}")
}

resource "grafana_dashboard" "logging" {
  folder      = grafana_folder.folder["Loki"].uid
  for_each    = fileset("${path.module}/dashboard/logging", "*.json")
  config_json = file("${path.module}/dashboard/logging/${each.value}")
}

resource "grafana_dashboard" "private" {
  folder      = grafana_folder.folder["Finance"].uid
  for_each    = fileset("${path.module}/dashboard/private", "*.json")
  config_json = file("${path.module}/dashboard/private/${each.value}")
}

resource "grafana_dashboard" "public" {
  folder      = grafana_folder.folder["Public"].uid
  for_each    = fileset("${path.module}/dashboard/public", "*.json")
  config_json = file("${path.module}/dashboard/public/${each.value}")
}

resource "grafana_dashboard_public" "public" {
  org_id        = grafana_organization.homelab.org_id
  dashboard_uid = each.value.uid

  for_each   = grafana_dashboard.public
  share      = "public"
  is_enabled = true
}