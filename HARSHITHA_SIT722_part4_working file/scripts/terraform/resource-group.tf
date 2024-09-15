#
# Creates a resource group for the project in Azure.
# A resource group is a logical container that holds related resources for your Azure solution.
#
resource "azurerm_resource_group" "sit722weektask04" {
  name     = var.app_name    # Name of the resource group, using the app name from variables for consistency.
  location = var.location    # Location/region where the resource group will be created, using the value from variables.
  
  # Tags can be used to organize and categorize your resources for cost tracking, auditing, or grouping.
  tags = {
    environment = var.environment  # E.g., "dev", "staging", "prod" to identify the environment.
    owner       = "Harshitha"      # Optional: Add your name as the owner for reference.
    project     = "SIT722 Task 04" # Optional: Add a project-specific tag for easier identification.
  }
}

#
# Additional comments:
#
# 1. The 'azurerm_resource_group' resource defines an Azure resource group.
#    It's a container for related resources, allowing you to manage them as a group.
#
# 2. 'var.app_name' and 'var.location' come from variables defined in another part of your code.
#    This helps keep your configuration DRY (Don't Repeat Yourself) by reusing common values.
#
# 3. Tags can be very helpful in organizing and managing resources, especially in large or multi-environment projects.
#    You can customize tags based on your requirements (e.g., department, billing code, etc.).
#

# Optional: Add outputs to display information about the created resource group.
output "resource_group_name" {
  value = azurerm_resource_group.sit722weektask04.name  # Outputs the name of the created resource group.
}

output "resource_group_location" {
  value = azurerm_resource_group.sit722weektask04.location  # Outputs the location of the resource group.
}
