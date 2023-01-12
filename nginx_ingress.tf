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

  depends_on = [
    kind_cluster.default
  ]
}