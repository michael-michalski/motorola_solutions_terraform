# resource "kubernetes_service" "nginx-ingress" {
#   metadata {
#     name = "nginx-ingress"
#     namespace = "nginx-ingress"
#   }
#   spec {
#     external_traffic_policy = "Local"
#     type = "LoadBalancer"
#     selector = {
#       app = "nginx-ingress"
#       namespace = "nginx-ingress"
#     }
#     port {
#       port        = 80
#       name        = "http"
#       target_port = "http"
#     }
#     port {
#       port        = 443
#       name        = "https"
#       target_port = "https"
#     }
#   }
# }

# resource "kubernetes_ingress" "example-ingress" {
#   metadata {
#     name = "example-ingress"
#   }

#   spec {
#     backend {
#       service_name = "grafana"
#       service_port = 3000
#     }

#     rule {
#       http {
#         path {
#           backend {
#             service_name = "grafana"
#             service_port = 3000
#           }

#           path = "/grafana"
#         }
#       }
#     }
#   }
# }