provider "kubernetes" {
  config_context_cluster   = "kind-moto_uni"
}

module "monitoring" {
  source = "./monitoring"
}
