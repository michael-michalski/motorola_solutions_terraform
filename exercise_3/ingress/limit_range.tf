resource "kubernetes_limit_range" "nginx-ingress-limit-range" {
  metadata {
    name = "nginx-ingress"
    namespace = "nginx-ingress"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
  spec {
    limit {
      type = "Container"
      min = {
        cpu    = "100m"
        memory = "90Mi"
      }
    }
  }
}