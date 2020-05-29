module "kuberntes_dashboard" {
  source = "./"

  domain = "example.com"
  tls = "secret-tls"
  cidr_whitelist = "0.0.0.0/0, 1.1.1.1/1"
}