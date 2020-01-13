resource "null_resource" "nginx-mandatory" {
  provisioner "local-exec" {
    command = "kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml"
  }
}

resource "null_resource" "nginx-kind-patch" {
  provisioner "local-exec" {
    command = "kubectl patch deployments -n ingress-nginx nginx-ingress-controller -p '{\"spec\":{\"template\":{\"spec\":{\"containers\":[{\"name\":\"nginx-ingress-controller\",\"ports\":[{\"containerPort\":80,\"hostPort\":80},{\"containerPort\":443,\"hostPort\":443}]}],\"nodeSelector\":{\"ingress-ready\":\"true\"},\"tolerations\":[{\"key\":\"node-role.kubernetes.io/master\",\"operator\":\"Equal\",\"effect\":\"NoSchedule\"}]}}}}'"
  }
  depends_on = ["null_resource.nginx-mandatory"]
}

resource "kubernetes_service" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
    namespace = "ingress-nginx"
    labels = {
      "app.kubernetes.io/name" = "ingress-nginx"
      "app.kubernetes.io/part-of" = "ingress-nginx"
    }
  }
  spec {
    selector = {
      "app.kubernetes.io/name" = "ingress-nginx"
      "app.kubernetes.io/part-of" = "ingress-nginx"
    }
    port {
      port        = 80
      name        = "http"
      target_port = "http"
    }
    port {
      port        = 443
      name        = "https"
      target_port = "https"
    }
  }
  depends_on = ["null_resource.nginx-mandatory"]
}