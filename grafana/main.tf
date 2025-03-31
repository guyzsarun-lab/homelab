resource "grafana_organization" "homelab" {
  name       = "homelab"
  admin_user = "admin"
  admins = [
    "guyzsarun@proxmox.local"
  ]
}

resource "grafana_folder" "folder" {
  org_id = grafana_organization.homelab.org_id

  title = each.key

  for_each = toset([
    "Networking",
    "Hardware",
    "Public",
    "Finance",
    "Loki"
  ])
}