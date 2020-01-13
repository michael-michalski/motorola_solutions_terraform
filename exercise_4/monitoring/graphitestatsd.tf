resource "kubernetes_service" "graphitestatsd" {
  metadata {
    name = "graphitestatsd"
  }
  spec {
    selector = {
      app = "graphitestatsd"
    }   
    port {
      port        = 8081
      name        = "graphite"
    }
    port {
      port     = 8125
      protocol = "UDP"
      name     = "statsd"
    }
  }
}

resource "kubernetes_deployment" "graphitestatsd" {
  metadata {
    name = "graphitestatsd"
    labels = {
      app = "graphitestatsd"
    }
  }

  spec {
    replicas = 1
    
    selector {
      match_labels = {
        app = "graphitestatsd"
      }
    }

    template {
      metadata {
        labels = {
          app = "graphitestatsd"
        }
      }

      spec {
        container {
          image = "michaelmichalski/graphitestatsd:latest"
          name  = "graphitestatsd"

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