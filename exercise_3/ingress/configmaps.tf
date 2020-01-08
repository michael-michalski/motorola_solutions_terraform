resource "kubernetes_config_map" "ingress-controller-leader-nginx" {
  metadata {
    name = "ingress-controller-leader-nginx"
    namespace = "nginx-ingress"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
}

resource "kubernetes_config_map" "nginx-configuration" {
  metadata {
    name = "nginx-configuration"
    namespace = "nginx-ingress"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
}


resource "kubernetes_config_map" "nginx-tcp-services" {
  metadata {
    name = "tcp-services"
    namespace = "nginx-ingress"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
}

resource "kubernetes_config_map" "nginx-udp-services" {
  metadata {
    name = "udp-services"
    namespace = "nginx-ingress"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
}