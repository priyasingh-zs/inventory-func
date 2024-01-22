include {
  path = find_in_parent_folders("backend-terragrunt.hcl")
}

locals {
  sources = read_terragrunt_config(find_in_parent_folders("sources.hcl"))
  version = "main"
}

terraform {
  source = "${local.sources.locals.terraform_namespace}?ref=${local.version}"
}

inputs = {
  app_name = "${basename(dirname(get_terragrunt_dir()))}"
  app_env  = "${basename(dirname(dirname(get_terragrunt_dir())))}"
  bucket_name  = "zs-devops-remote-state"
  namespace = "${basename(get_terragrunt_dir())}"
  vpc    = "dev"
  subnet = "dev-private-subnet"
  artifact_registry_location = "us-central1"

  services = {
    order-data = {
      enable_default_ingress = true
    }
  }
}