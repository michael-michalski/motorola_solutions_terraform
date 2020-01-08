resource "kubernetes_namespace" "nginx-ingress" {
  metadata {
    name = "nginx-ingress"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
}