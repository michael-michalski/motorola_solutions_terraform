provider "kubernetes" {
  config_context_cluster   = "kind-moto-uni-ingress"
}

module "ingress" {
  source = "./ingress"
}

module "monitoring" {
  source = "./monitoring"
}
