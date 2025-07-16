resource "grafana_organization" "homelab" {
  name       = "homelab"
  admin_user = "admin"
  admins = [
    "guyzsarun@proxmox.local"
  ]
}