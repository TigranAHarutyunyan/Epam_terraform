terraform {
  required_version = ">= 1.5.7"
  required_providers {
    azurerm = {
      source  = "hasicorp/azurerm"
      version = ">= 3.110.0, < 4.0.0"
    }
  }
}