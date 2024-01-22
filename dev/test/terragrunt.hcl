# Include all settings from the root backend-terragrunt.hcl file
include {
  path = find_in_parent_folders("backend-terragrunt.hcl")
}

locals {
  sources = read_terragrunt_config(find_in_parent_folders("sources.hcl"))
  version = "main"
}

terraform {
  source = "${local.sources.locals.terraform_cluster}?ref=${local.version}"
}

inputs = {
  app_name        = "${basename(get_terragrunt_dir())}"
  app_env         = "${basename(dirname(get_terragrunt_dir()))}"
  app_region      = "us-central1"

  vpc    = "${basename(dirname(get_terragrunt_dir()))}"
  subnet = "${basename(dirname(get_terragrunt_dir()))}-private-subnet"

  user_access = {
    app_admins  = ["priya.singh@zopsmart.com"]
  }


  observability_config = {
    grafana = {
      enabled     = true
    }
  }

  node_config = {
    required_cpu    = 2
    required_memory = "8GB"
    min_count       = 2
    max_count       = 3
  }
}