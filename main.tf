terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
    }
  }
}

provider "grafana" {
  url                  = var.grafana_url
  auth                 = var.grafana_auth
  insecure_skip_verify = var.insecure_skip_verify
}
