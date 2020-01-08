resource "kubernetes_role" "nginx-ingress-role" {
  metadata {
    name = "nginx-ingress-role"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
  rule {
    api_groups = [""]
    resources  = ["configmaps", "pods", "secrets", "namespaces"]
    verbs      = ["get"]
  }
  rule {
    api_groups = [""]
    resources  = ["configmaps"]
    resource_names = ["ingress-controller-leader-nginx"]
    verbs      = ["get", "update"]
  }
  rule {
    api_groups = [""]
    resources  = ["configmaps"]
    verbs      = ["create"]
  }
  rule {
    api_groups = [""]
    resources  = ["endpoints"]
    verbs      = ["get"]
  }
}