resource "grafana_data_source" "google-sheets" {
  type = "grafana-googlesheets-datasource"
  name = "google-sheets-terraform"

  json_data_encoded = jsonencode({
    "tokenUri"           = var.google-sheets-datasource.tokenUri
    "authenticationType" = var.google-sheets-datasource.authenticationType
    "defaultProject"     = var.google-sheets-datasource.defaultProject
    "clientEmail"        = var.google-sheets-datasource.clientEmail
  })

  secure_json_data_encoded = jsonencode({
    "privateKey" = var.google-sheets-datasource.privateKey
  })
}

resource "grafana_data_source" "loki" {
  type = "loki"
  name = "loki-terraform"

  url          = var.loki-datasource.url
  http_headers = var.loki-datasource.http_headers
}