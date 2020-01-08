resource "kubernetes_cluster_role_binding" "nginx-ingress-clusterrole-nisa-binding" {
  metadata {
    name = "nginx-ingress-clusterrole-nisa-binding"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "nginx-ingress-clusterrole"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "nginx-ingress-serviceaccount"
    namespace = "nginx-ingress"
  }
}