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

  values = [file("nginx_ingress_values.yml")]

  depends_on = [
    kind_cluster.default
  ]
}

resource "null_resource" "wait_for_ingress_nginx" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<EOF
        printf "\nWaiting for the nginx ingress controller...\n"
        kubectl wait --namespace ${helm_release.nginx_ingress.namespace} \
            --for=condition=ready pod \
            --selector=app.kubernetes.io/component=controller \
            --timeout=90s
        EOF
  }

  depends_on = [
    helm_release.nginx_ingress
  ]
}