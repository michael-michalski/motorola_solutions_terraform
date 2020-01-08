resource "kubernetes_service_account" "nginx-ingress-serviceaccount" {
  metadata {
    name = "nginx-ingress-serviceaccount"
    namespace = "nginx-ingress"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
}