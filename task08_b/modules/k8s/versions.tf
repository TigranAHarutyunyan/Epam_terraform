terraform {
  required_version = ">= 1.5.7"

  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "= 2.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.30.0"
    }
  }
}
