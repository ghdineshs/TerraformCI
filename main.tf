terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }
  cloud {
    organization = "ghd-company"

    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}


resource "azurerm_resource_group" "rg" {
  name     = "1-e58e54af-playground-sandbox"
  location = "eastus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "ghdstr008"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
}
