provider "kubernetes" {
  config_context_cluster   = "kind-moto-uni-ingress"
}

module "monitoring" {
  source = "./monitoring"
}
