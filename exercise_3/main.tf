provider "kubernetes" {
  config_context_cluster   = "kind-moto-uni-ingress"
}

module "ingress" {
  source = "./ingress"
}

# module "monitoring" {
#   source = "./monitoring"
# }

module "ingress-nginx-controller" {
  source  = "zioproto/ingress-nginx-controller/kubernetes"
  version = "0.0.1"
}
