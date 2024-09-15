#
# Specifies the required providers and versions for the Terraform project.
#
terraform {
  # Declares the providers necessary for this configuration.
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"       # Defines the AzureRM provider source from HashiCorp.
      version = "~> 3.71.0"               # Ensures compatibility with version 3.71.0 but allows for backward-compatible updates (any 3.x.x version above 3.71).
    }
  }

  # Specifies the required version of Terraform itself to ensure configuration works as expected.
  required_version = ">= 1.5.6"           # Ensures that Terraform version 1.5.6 or later is used for this configuration.
}

#
# Configures the Azure provider.
#
provider "azurerm" {
  features {}                              # Enables all necessary AzureRM features (required by AzureRM but kept empty).
  
  # Optional: Set default subscription ID and tenant ID to avoid specifying in each resource (or load from environment variables).
  # subscription_id = var.subscription_id  # Set your Azure subscription ID from a variable or use `ARM_SUBSCRIPTION_ID` env variable.
  # tenant_id       = var.tenant_id        # Set your Azure tenant ID from a variable or use `ARM_TENANT_ID` env variable.

  # Optional: Allows you to specify default location, which can be used globally for all resources.
  # Note: Default location is also set by individual resources or resource groups.
  # defaults {
  #   location = "East US"                # Set a default region for all Azure resources (overrideable by individual resources).
  # }
}

#
# Optional: Define backend for storing Terraform state remotely.
# This is important for collaborating on Terraform projects and ensuring state persistence.
#
# backend "azurerm" {
#   resource_group_name  = "tfstate-rg"    # Resource group to store the Terraform state.
#   storage_account_name = "tfstatestorage" # Storage account for state files.
#   container_name       = "tfstate"       # Blob container for Terraform state.
#   key                  = "terraform.tfstate"  # Key (name) for the state file in the container.
# }

#
# Optional: Enable diagnostics for the Azure provider.
# This is useful for debugging and logging provider issues.
#
provider "azurerm" {
  features {}
  
  # Enable detailed logging (useful for development and debugging)
  log_level = "DEBUG"                      # Optional: Set logging level to DEBUG to get more detailed information during execution.

  # Optionally specify different configuration options for multiple subscriptions
  # alias = "example"                      # You can create multiple instances of the provider with different aliases.
}

#
# Optional: Output Terraform version and provider versions for debugging and record-keeping.
# This can be helpful for tracking the versions used in a deployment.
#
output "terraform_version" {
  value = terraform.version                # Outputs the current version of Terraform.
}

output "azurerm_provider_version" {
  value = azurerm.provider_version         # Outputs the current version of the AzureRM provider.
}
