resource "kong-gateway_plugin_prometheus" "prometheus" {
  config = {
    bandwidth_metrics       = true
    latency_metrics         = true
    per_consumer            = false
    status_code_metrics     = true
    upstream_health_metrics = true
  }

  enabled       = true
  instance_name = "prometheus-metrics"
  protocols = [
    "https", "http"
  ]
}