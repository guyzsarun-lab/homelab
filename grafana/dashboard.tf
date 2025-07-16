locals {
  folder = setsubtract(flatten([for k, _ in toset(fileset("${path.module}/dashboard/", "**")) : dirname(k)]), ["."])
}

resource "grafana_folder" "folder_template" {
  org_id = grafana_organization.homelab.org_id

  for_each = local.folder
  title    = each.key
}

resource "grafana_dashboard" "dashboard_template" {
  folder = grafana_folder.folder_template[split("/", each.value)[0]].uid

  for_each    = toset(flatten([for folder in local.folder : [for file in fileset("${path.module}/dashboard/${folder}/", "*json") : "${folder}/${file}"]]))
  config_json = file("${path.module}/dashboard/${each.value}")
}

resource "grafana_dashboard_public" "public" {
  org_id        = grafana_organization.homelab.org_id
  dashboard_uid = grafana_dashboard.dashboard_template["public/${each.value}"].uid

  for_each   = fileset("${path.module}/dashboard/public/", "*json")
  share      = "public"
  is_enabled = true
}

output "grafana_dashboard_public_uid" {
  value = { for k, v in grafana_dashboard_public.public : k => v.access_token }
}