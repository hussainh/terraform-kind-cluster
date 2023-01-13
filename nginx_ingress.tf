provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kind_cluster_config_path)
  }
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "nginx-ingress"
  version    = var.ingress_nginx_helm_version

  namespace = var.ingress_nginx_namespace
  create_namespace = true

  values = [file(nginx_ingress_values.yml)]

  depends_on = [
    kind_cluster.default
  ]
}

resource "null_resource" "cluster" {
  triggers = {
    key = uuid()
  }

  depends_on = [
    helm_release.nginx_ingress
  ]
}