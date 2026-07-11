terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "976182b9-e908-47f4-9ee2-ba19ba1d1f1d"
}
