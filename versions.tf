terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.24.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

    kind = {
      source = "unicell/kind"
      version = "0.0.2-u2"
    }
  }
}