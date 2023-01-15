variable "kind_cluster_name" {
  type    = string
  default = "local"
}

variable "kind_cluster_config_path" {
  type    = string
  default = "~/.kube/config"
}

variable "ingress_nginx_helm_version" {
  type    = string
  default = "4.4.2"
}

variable "ingress_nginx_namespace" {
  type    = string
  default = "ingress-nginx"
}