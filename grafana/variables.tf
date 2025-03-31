variable "grafana_url" {
  description = "URL of the Grafana instance"
  type        = string
  default     = "https://k8s.proxmox.local/grafana"
}

variable "grafana_credentials" {
  description = "Credentials for Grafana"
  type        = string
  sensitive   = true
}