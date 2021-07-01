# Kubernetes UI dashboard

Terraform module create dashboard for access to kubernetes cluster.

## Wokrflow

Module base on helm chart and create all necessary resources for kubernetes dashboard as a kubernetes service. Previously you need to create kubernetes secret with certificate to your domain name.
Also, optional (default ***true***), you can create admin user with access token.

## Software Requirements

Name | Description
--- | --- |
Terraform | >= v0.14.9

## Usage

```
module "kuberntes_dashboard" {
  source = "../"

  domain = "example.com"
  tls = "secret-tls"
  cidr_whitelist = "0.0.0.0/0, 1.1.1.1/1"
  
  additional_set = [
    {
      name  = "ingress.annotations.kubernetes\\.io/ingress\\.class"
      value = "nginx-internal"
      type  = "string"
    }
  ]
}
```

## Inputs

Name | Description | Type | Default | Example | Required
--- | --- | --- | --- |--- |--- 
create_namespace | Create namespace by module? true or false | `bool` | true | n/a | no
namespace | Name of namespace where you want to deploy dashboard | `string` | `kubernetes-dashboard` | n/a | no
tls | TLS Secret name for main domain URL | `string` | n/a | `secret-tls` | yes
dashboard_subdomain | Sub-domain for access to dashbord via web-browser | `string` | `kubernetes-dashboard.` | n/a | no
domain | Name of main domain for URL | `string` | n/a | `example.com` | yes
cidr_whitelist | General allow list for remote IP addresses | `string` | `0.0.0.0/0` | `8.8.8.8/32,192.168.1.1/16` | no
readonly_user | Enable or disable default readonly access to dashboard | `bool` | true | n/a | no
create_admin_token | Create admin token for auth | `bool` | true | n/a | no
additional_set | Add additional set for helm kubernetes-dashboard | `list(string)` | `[]` | n/a | no
enable_skip_button | Skip login page for readyonly access | `bool` | true | n/a | no
chart_version | Helm Chart version | `string` | `4.3.1` | n/a | no

## Outputs

Name | Description
--- | --- 
admin_token | Token (if you choose **create_admin_token=true**)
admin_service_account | Name of admin service account (if you choose **create_admin_token=true**)
namespace | Name of namespace where dashboard deployed
dashboard_url | URL for access to dashboard via web-browser

