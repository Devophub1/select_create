provider "azurerm" {
    features {}        
}

resource "azurerm_resource_group" "rg" {
    name     = var.rg_name
    location = var.location
    tags     = var.tags  
}

resource "azurerm_storage_account" "rg" {
  name                     = "venkatstorageaccount955"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_app_service_plan" "rg" {
  name                = "venkatserviceplan955"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "rg" {
  name                       = "venkatfunctionapp955"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.rg.id
  storage_account_name       = azurerm_storage_account.rg.name
  storage_account_access_key = azurerm_storage_account.rg.primary_access_key
}