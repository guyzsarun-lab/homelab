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

variable "google-sheets-datasource" {
  description = "Google Sheets Datasource Configuration"
  type = object({
    tokenUri           = string
    authenticationType = string
    defaultProject     = string
    clientEmail        = string
    privateKey         = string
  })
}