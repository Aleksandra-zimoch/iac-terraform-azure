resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = var.app_service_plan_location
  resource_group_name = var.resource_group_name
  kind                = "Linux"  
  reserved            = true
  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }
}

resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = var.app_service_location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.example.id
}

resource "azurerm_app_service_certificate" "example" {
  name                = var.app_service_certificate_name
  resource_group_name = var.resource_group_name
  location            = var.app_service_location
  app_service_name    = azurerm_app_service.example.name
  pfx_password        = var.app_service_certificate_password
  certificate         = filebase64(var.app_service_certificate_path)
}
