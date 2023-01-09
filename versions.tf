terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.16.1"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.8.0"
    }

    kind = {
      source = "kyma-incubator/kind"
      version = "0.0.11"
    }

    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}