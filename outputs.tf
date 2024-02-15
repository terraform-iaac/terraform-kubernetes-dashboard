output "admin_token" {
  value = var.create_admin_token ? lookup(kubernetes_secret_v1.admin_token[0].data, "token") : "Not enabled"
}
output "admin_service_account" {
  value = kubernetes_service_account_v1.admin_service_account[0].metadata[0].name
}
output "namespace" {
  value = var.create_namespace ? kubernetes_namespace.namespace[0].id : var.namespace
}
output "dashboard_url" {
  value = "${var.dashboard_subdomain}${var.domain}"
}