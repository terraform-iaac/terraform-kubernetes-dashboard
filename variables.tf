locals {
  dashboard_chart                 = "kubernetes-dashboard"
  dashboard_admin_service_account = "kubernetes-dashboard-admin"
  dashboard_repository            = "https://kubernetes.github.io/dashboard/"
}

variable "create_namespace" {
  description = "Create namespace by module ? true or false"
  type        = bool
  default     = true
}
variable "namespace" {
  description = "Namespace name"
  type        = string
  default     = "kubernetes-dashboard"
}
variable "tls" {
  description = "TLS Secret name for URL"
  type        = string
}
variable "dashboard_subdomain" {
  type    = string
  default = "kubernetes-dashboard."
}
variable "domain" {
  description = "(Required) Domain for URL"
  type        = string
}
variable "cidr_whitelist" {
  description = "General Whitelist for all URLs"
  type        = string
  default     = "0.0.0.0/0"
}
variable "readonly_user" {
  description = "Enable or disable default readonly access to dashboard"
  default     = true
}
variable "create_admin_token" {
  description = "Create admin token for auth"
  default     = true
}
variable "additional_set" {
  description = "Add additional set for helm kubernetes-dashboard"
  default     = []
}
variable "enable_skip_button" {
  description = "Skip login page for readyonly access"
  type        = bool
  default     = true
}
variable "chart_version" {
  description = "Helm Chart version (Not Recomended)"
  type        = string
  default     = "4.3.1"
}