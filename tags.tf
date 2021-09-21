locals {
  common_tags = {
    Project         = "hands-on-cloud"
    ManagedBy       = "Terraform"
    Environment     = var.env
  }
}

