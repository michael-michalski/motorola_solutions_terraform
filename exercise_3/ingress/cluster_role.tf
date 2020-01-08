resource "kubernetes_cluster_role" "nginx-ingress-clusterrole" {
  metadata {
    name = "nginx-ingress-clusterrole"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
  rule {
    api_groups = [""]
    resources  = ["configmaps", "endpoints", "nodes", "pods", "secrets"]
    verbs      = ["list", "watch"]
  }
  rule {
    api_groups = [""]
    resources  = ["nodes"]
    verbs      = ["get"]
  }
  rule {
    api_groups = [""]
    resources  = ["services"]
    verbs      = ["get", "list", "watch"]
  }
  rule {
    api_groups = [""]
    resources  = ["events"]
    verbs      = ["create", "patch"]
  }
  rule {
    api_groups = ["extensions", "networking.k8s.io"]
    resources  = ["ingresses"]
    verbs      = ["get", "list", "watch"]
  }
  rule {
    api_groups = ["extensions", "networking.k8s.io"]
    resources  = ["ingresses/status"]
    verbs      = ["status"]
  }
}