variable "grafana_auth" {
  type        = string
  description = "[REQUIRED] Grafana instance service account token. Should have privileges for reading & writing dashboards & folders."
}

variable "grafana_url" {
  type        = string
  description = "[REQUIRED] Grafana instance URL."
  default     = "https://localhost:3000/"
}

variable "insecure_skip_verify" {
  type        = bool
  description = "[OPTIONAL] Skip TLS verification."
  default     = true
}
