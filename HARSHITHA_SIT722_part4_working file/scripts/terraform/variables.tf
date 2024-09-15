#
# Global variables for the Terraform project.
# These variables define commonly used values across the project, ensuring consistency and ease of updates.
#

# Application name, used across various resources for naming consistency.
variable "app_name" {
  description = "The name of the application or project."
  default     = "sit722week08task04"  # Default project name. Can be overridden during runtime.
}

# Location/region for deploying resources. This ensures all resources are deployed in the same Azure region.
variable "location" {
  description = "Azure region where resources will be deployed."
  default     = "australiaeast"  # Default location for the project. Choose the closest region for performance.
}

# Kubernetes version to be used in the Azure Kubernetes Service (AKS) cluster.
variable "kubernetes_version" {
  description = "Version of Kubernetes to use for the AKS cluster."
  default     = "1.30.3"  # Default Kubernetes version. Ensure this is compatible with Azure AKS.
}

#
# Additional essential variables:
#

# Environment variable to distinguish between different deployment environments (e.g., dev, staging, prod).
variable "environment" {
  description = "Deployment environment (e.g., dev, staging, production)."
  default     = "dev"  # Default environment. This should be changed depending on the environment (dev, prod, etc.).
}

# The number of nodes in the default node pool of the AKS cluster.
variable "node_count" {
  description = "Number of nodes in the Kubernetes cluster node pool."
  type        = number  # Specifies the variable type is a number.
  default     = 1  # Default node count. Can be scaled up for larger environments.
}

# The size of the virtual machine for the Kubernetes nodes.
variable "vm_size" {
  description = "Azure VM size for Kubernetes nodes."
  default     = "Standard_B2s"  # A low-cost, general-purpose size suitable for small clusters. Can be adjusted based on performance needs.
}

# Optional: Tag to define the owner of the project/resources.
variable "owner" {
  description = "Owner or manager of the project resources."
  default     = "Harshitha"  # Set this to your name or whoever is responsible for managing the project.
}

#
# Notes:
# 1. Using variables allows for greater flexibility in your Terraform configurations.
#    It makes it easy to switch environments (e.g., from development to production) by overriding defaults.
# 2. These variables are global and can be referenced across your Terraform configuration files,
#    ensuring consistency in resource naming, location, and settings.
# 3. Ensure that any default values (e.g., Kubernetes version, VM size) are updated to reflect the latest standards or project needs.
#

# Optional: Add output to see the environment variable in the logs.
output "environment" {
  value = var.environment  # Outputs the environment variable value for reference.
}
