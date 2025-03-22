variable "kong_admin_url" {
  description = "The URL for the Kong Admin API"
  type        = string
  default     = "http://localhost:8001"
}

variable "kong_manager_credentials" {
  description = "The credentials for the Kong Manager"
  type = object({
    username = string
    password = string
  })
  sensitive = true
}