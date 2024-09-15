# Creates a container registry on Azure to publish and store Docker images.
# This registry will be linked to a specified resource group and location.

# Define the Azure Container Registry (ACR) resource
resource "azurerm_container_registry" "container_registry" {
  name                = var.app_name                       # Name of the container registry, fetched from a variable for flexibility.
  resource_group_name = azurerm_resource_group.sit722weektask04.name  # Resource group where the registry will be created.
  location            = var.location                       # Location (Azure region) for the registry, fetched from a variable for flexibility.
  admin_enabled       = true                               # Enables admin user access for the registry, useful for development and debugging.
  sku                 = "Basic"                            # Defines the pricing tier of the registry. Can be Basic, Standard, or Premium based on requirements.

  # Tags help in organizing resources (optional but recommended)
  tags = {
    environment = "dev"  # Tag to indicate the environment (can be dev, prod, etc.)
    project     = var.project_name  # Custom project tag fetched from variables for easy resource tracking.
  }
}

# Creates an Azure Resource Group, in case it's not defined elsewhere.
# This group acts as a container that holds the container registry and other related resources.
resource "azurerm_resource_group" "sit722weektask04" {
  name     = "sit722weektask04-rg"  # Define the resource group name (can be set dynamically if needed).
  location = var.location           # Use the same location as the container registry.
}

# Output the login server URL of the container registry for easy reference
# This can be useful when pushing Docker images to the ACR.
output "acr_login_server" {
  value = azurerm_container_registry.container_registry.login_server  # Outputs the registry URL to push/pull images.
}

# Optional: Assign role-based access control (RBAC) for specific users or services
# This example grants the "AcrPush" role to a specific service principal, allowing it to push images.
resource "azurerm_role_assignment" "acr_push" {
  principal_id   = var.service_principal_id  # The service principal or user who will have push access.
  role_definition_name = "AcrPush"           # Role definition for pushing Docker images.
  scope          = azurerm_container_registry.container_registry.id  # The scope is limited to the container registry.
}
