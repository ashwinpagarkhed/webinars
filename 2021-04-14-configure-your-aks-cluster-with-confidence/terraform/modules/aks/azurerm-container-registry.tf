resource "azurerm_container_registry" "aks" {
  name = local.prefix
  resource_group_name = var.resource_group.name
  location =  var.resource_group.location
  sku = "Standard"
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_container_registry.aks.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.dev.identity.id
}