terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  #client_id                   = "00000000-0000-0000-0000-000000000000"
  #client_certificate_path     = var.client_certificate_path
  #client_certificate_password = var.client_certificate_password
  #tenant_id                   = "10000000-0000-0000-0000-000000000000"

  #cdh7195@naver.com- Azure 구독 1

  subscription_id = "bc32e0d9-d804-4b18-aa8f-aa13f5723496"
}
