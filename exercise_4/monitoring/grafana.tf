resource "kubernetes_service" "grafana" {
  metadata {
    name = "grafana"
  }
  spec {
    selector = {
      app = "grafana"
    }
    port {
      port        = 3000
      name        = "admin"
    }
  }
}

resource "kubernetes_deployment" "grafana" {
  metadata {
    name = "grafana"
    labels = {
      app = "grafana"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "grafana"
      }
    }

    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }

      spec {
        container {
          image = "grafana/grafana:latest"
          name  = "grafana"

          env {
              name = "GF_SERVER_ROOT_URL"
              value = "/grafana/"
          }
        #   env {
        #         name = "GF_SERVER_DOMAIN"
        #         value = "localhost"
        #   }

          resources {
            limits {
              cpu    = "1.0"
              memory = "512Mi"
            }
            requests {
              cpu    = "512m"
              memory = "250Mi"
            }
          }
        }
      }
    }
  }
}