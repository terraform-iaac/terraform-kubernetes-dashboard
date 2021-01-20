output "admin_token" {
  value = var.create_admin_token ? lookup(data.kubernetes_secret.admin_token[0].data, "token") : "Not enabled"
}
output "admin_service_account" {
  value = local.dashboard_admin_service_account
}
output "namespace" {
  value = var.namespace
}
output "dashboard_url" {
  value = "${var.dashboard_subdomain}${var.domain}"
}