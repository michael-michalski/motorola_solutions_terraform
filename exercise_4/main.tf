provider "kubernetes" {
  config_context_cluster   = "kind-moto-uni"
}

module "monitoring" {
  source = "./monitoring"
}
