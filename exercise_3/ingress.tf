resource "kubernetes_ingress" "monitoring-ingress" {
  metadata {
    name = "monitoring-ingress"
  }

  spec {
    backend {
      service_name = "grafana"
      service_port = 3000
    }

    rule {
      http {
        path {
          backend {
            service_name = "grafana"
            service_port = 3000
          }

          path = "/grafana/"
        }
      }
    }
  }
}