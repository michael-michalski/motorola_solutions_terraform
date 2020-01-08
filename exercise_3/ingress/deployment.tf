resource "kubernetes_deployment" "nginx-ingress-controller" {
  metadata {
    name = "nginx-ingress-controller"
    namespace = "nginx-ingress"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        "app.kuberentes.io/name" = "nginx-ingress"
        "app.kuberentes.io/part-of" = "nginx-ingress"
      }
    }

    template {
      metadata {
        labels = {
          "app.kuberentes.io/name" = "nginx-ingress"
          "app.kuberentes.io/part-of" = "nginx-ingress"
        }
        annotations = {
          "prometheus.io/port" = "10254"
          "prometheus.io/scrape" = "true"
        }
      }

      spec {
        termination_grace_period_seconds = 300
        service_account_name = "nginx-ingress-serviceaccount"
        container {
          image = "quay.io/kubernetes-ingress-controller/nginx-ingress-controller:master"
          name  = "nginx-ingress-controller"

          args = [
            "/nginx-ingress-controller",
            "--configmap=$(POD_NAMESPACE)/nginx-configuration",
            "--tcp-services-configmap=$(POD_NAMESPACE)/tcp-services",
            "--udp-services-configmap=$(POD_NAMESPACE)/udp-services",
            "--publish-service=$(POD_NAMESPACE)/ingress-nginx",
            "--annotations-prefix=nginx.ingress.kubernetes.io"
          ]

          security_context {
            allow_privilege_escalation = true
            run_as_user = 101
            capabilities {
              add = ["NET_BIND_SERVICE"]
              drop = ["ALL"]
            }
          }

          env{
            name = "POD_NAME"
            value_from {
              field_ref {
                field_path = "metadata.name"
              }
            }
          }
          env{
            name = "POD_NAMESPACE"
            value_from {
              field_ref {
                field_path = "metadata.namespace"
              }
            }
          }
          port{
            name = "http"
            container_port = 80
            protocol = "TCP"
          }
          port{
            name = "https"
            container_port = 443
            protocol = "TCP"
          }

          liveness_probe {
            http_get {
              path = "/healthz"
              port = 10254
              scheme = "HTTP"
            }
            failure_threshold      = 3
            initial_delay_seconds = 10
            period_seconds        = 10
            success_threshold     = 1
            timeout_seconds       = 10
          }
          readiness_probe {
            http_get {
              path = "/healthz"
              port = 10254
              scheme = "HTTP"
            }
            failure_threshold      = 3
            period_seconds        = 10
            success_threshold     = 1
            timeout_seconds       = 10
          }
          lifecycle {
            pre_stop {
              exec{
                command = ["/wait-shutdown"]
              }
            }
          }
        }
      }
    }
  }
}
